#!/bin/sh

if [[ -n "$(pgrep spotify)" && $(playerctl -p spotify status) == 'Playing' ]]
then
	control='spotify'
	player='spotify'
elif [[ -n "$(pgrep youtube-music)" && $(playerctl -p $(playerctl -l | grep 'chromium') status) == 'Playing' ]]
then
	control=$(playerctl -l | grep 'chromium')
	player='chromium'
elif [[ -n "$(playerctl -l | grep "firefox")" ]]
then
	control=$(playerctl -l | grep 'firefox')
	player='firefox'
fi

if [[ -n $control ]]
then
if [[ -n $(playerctl -p $control metadata title) ]]
then
	title=$(playerctl -p $control metadata title)
	title=${title,,}
fi

if [[ -n $(playerctl -p $control metadata artist) ]]
then
	artist=$(playerctl -p $control metadata artist)
	artist=${artist,,}
fi
fi

if [[ $player == 'spotify' ]]
then
	echo " $title by $artist"
elif [[ $player == 'chromium' ]]
then
	echo "%{F#bf616a} $title by $artist"
elif [[ $player == 'firefox' ]]
then
	echo "%{F#a39ec4}󰑈 $title"
fi

if [[ -z "$(playerctl -l)" || "$(playerctl status)" == "Paused" ]]
then
	echo "hi, have a good day!"
fi
