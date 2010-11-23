#!/bin/bash

# create variables
while read L; do
	k="`echo "$L" | cut -d '=' -f 1`"
	v="`echo "$L" | cut -d '=' -f 2`"
	export "$k=$v"
done < <(grep -e '^\(title\|artist\|album\|stationName\|pRet\|pRetStr\|wRet\|wRetStr\|songDuration\|songPlayed\|rating\|coverArt\)=' /dev/stdin)

case "$1" in
	songstart)
		if [ $rating -eq 1 ]
		then
			heart="<3"
		else
			heart=""
		fi
		if [ ! -d ~/.config/pianobar/art ] 
		then
			mkdir ~/.config/pianobar/art
		fi
		cd ~/.config/pianobar/art
		rm * 2> /dev/null
		wget -q "$coverArt"
		echo "\"$title\" by \"$artist\" on \"$album\" $heart" | growlnotify --image * -d 12 pianobar
	;;
esac

