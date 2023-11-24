#!/bin/bash
killall -q polybar &
wait
if type "xrandr"; then
	my_laptop_external_monitor=$(xrandr --query | grep 'DVI')
	if [[ $my_laptop_external_monitor = *connected* ]]; then
  	polybar --reload sbar &
	fi
  polybar --reload fbar &
fi
