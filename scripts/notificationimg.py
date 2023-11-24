#!/usr/bin/env python

import contextlib
import datetime

import dbus
import gi

gi.require_version("GdkPixbuf", "2.0")
from gi.repository import GdkPixbuf, GLib
from dbus.mainloop.glib import DBusGMainLoop


def unwrap(value):
    # Try to trivially translate a dictionary's elements into nice string
    # formatting.
    if isinstance(value, dbus.ByteArray):
        return "".join([str(byte) for byte in value])
    if isinstance(value, (dbus.Array, list, tuple)):
        return [unwrap(item) for item in value]
    if isinstance(value, (dbus.Dictionary, dict)):
        return dict([(unwrap(x), unwrap(y)) for x, y in value.items()])
    if isinstance(value, (dbus.Signature, dbus.String)):
        return str(value)
    if isinstance(value, dbus.Boolean):
        return bool(value)
    if isinstance(
        value,
        (dbus.Int16, dbus.UInt16, dbus.Int32, dbus.UInt32, dbus.Int64, dbus.UInt64),
    ):
        return int(value)
    if isinstance(value, dbus.Byte):
        return bytes([int(value)])
    return value


def save_img_byte(px_args, id):
    # gets image data and saves it to file
    save_path = f"/tmp/notifications/{id}.png"
    # https://specifications.freedesktop.org/notification-spec/latest/ar01s08.html
    # https://specifications.freedesktop.org/notification-spec/latest/ar01s05.html
    GdkPixbuf.Pixbuf.new_from_bytes(
        width=px_args[0],
        height=px_args[1],
        has_alpha=px_args[3],
        data=GLib.Bytes(px_args[6]),
        colorspace=GdkPixbuf.Colorspace.RGB,
        rowstride=px_args[2],
        bits_per_sample=px_args[4],
    ).savev(save_path, "png")
    return save_path


def message_callback(_, message):
    if type(message) != dbus.lowlevel.MethodCallMessage:
        return
    args_list = message.get_args_list()
    args_list = [unwrap(item) for item in args_list]
    details = {
        "appname": args_list[0],
        "summary": args_list[3],
        "body": args_list[4],
        "urgency": args_list[6]["urgency"],
        "iconpath": None,
    }
    if args_list[5]:
        details["iconpath"] = args_list[2]
    with contextlib.suppress(KeyError):
        # for some reason args_list[6]["icon_data"][6] i.e. the byte data
        # does not change unless I restart spotify but, the song title
        # (body / summary) change gets picked up.
        details["iconpath"] = save_img_byte(args_list[6]["image-data"], args_list[1])


DBusGMainLoop(set_as_default=True)

rules = {
    "interface": "org.freedesktop.Notifications",
    "member": "Notify",
    "eavesdrop": "true", # https://bugs.freedesktop.org/show_bug.cgi?id=39450
}

bus = dbus.SessionBus()
bus.add_match_string(",".join([f"{key}={value}" for key, value in rules.items()]))
bus.add_message_filter(message_callback)

loop = GLib.MainLoop()
try:
    loop.run()
except KeyboardInterrupt:
    bus.close()

# vim:filetype=python
