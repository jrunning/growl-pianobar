#!/bin/bash

# create variables
while read L; do
	k="`echo "$L" | cut -d '=' -f 1`"
	v="`echo "$L" | cut -d '=' -f 2`"
	export "$k=$v"
done < <(grep -e '^\(title\|artist\|album\|stationName\|pRet\|pRetStr\|wRet\|wRetStr\|songDuration\|songPlayed\|rating\)=' /dev/stdin)

case "$1" in
	songstart)
		if [ $rating -eq 1 ]
		then
			heart="<3"
		else
			heart=""
		fi
		echo "\"$title\" by \"$artist\" on \"$album\" $heart" | growlnotify pianobar
	;;
esac

