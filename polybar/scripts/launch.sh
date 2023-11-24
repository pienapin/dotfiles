#!/usr/bin/env sh

if ! pgrep -x polybar; then

		bspc config -m HDMI-A-0 top_padding 75
		bspc config -m DVI-D-0 top_padding 45

    polybar -c ~/.config/polybar/config.ini spotify &
    polybar -c ~/.config/polybar/config.ini weather &
    polybar -c ~/.config/polybar/config.ini updates &
    polybar -c ~/.config/polybar/config.ini bspwm &
    polybar -c ~/.config/polybar/config.ini filesystem &
    polybar -c ~/.config/polybar/config.ini memory &
    polybar -c ~/.config/polybar/config.ini cpu &
    polybar -c ~/.config/polybar/config.ini pulseaudio &
    polybar -c ~/.config/polybar/config.ini mic &
    polybar -c ~/.config/polybar/config.ini date &
    polybar -c ~/.config/polybar/config.ini powermenu &
	
    polybar -c ~/.config/polybar/config.ini bspwmscnd &
    polybar -c ~/.config/polybar/config.ini pulseaudioscnd &
    polybar -c ~/.config/polybar/config.ini micscnd &
    polybar -c ~/.config/polybar/config.ini datescnd &
    polybar -c ~/.config/polybar/config.ini powermenuscnd &
else
    killall -q polybar
		bspc config -m HDMI-A-0 top_padding 0
		bspc config -m DVI-D-0 top_padding 0
fi
