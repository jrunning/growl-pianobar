#!/bin/bash

# create variables
while read L; do
	k="`echo "$L" | cut -d '=' -f 1`"
	v="`echo "$L" | cut -d '=' -f 2`"
	export "$k=$v"
done < <(grep -e '^\(title\|artist\|album\|stationName\|pRet\|pRetStr\|wRet\|wRetStr\|songDuration\|songPlayed\|rating\|coverArt\)=' /dev/stdin)

DIR=$(cd `dirname $0` && pwd) # Where this script lives
iconPath="$DIR/pandora-icon-cc-by-sa-rossr.png"

case "$1" in
	# React when the song changes
	songstart)
	# Since $rating is a number, we translate it into a heart if the user likes the song or
	# not.
		if [ $rating -eq 1 ]
		then
			heart="♥ "
		else
			heart=""
		fi
		
		# This makes sure the directory for storing the album art exists

		if [ ! -d ~/.config/pianobar/art ] 
		then
			mkdir ~/.config/pianobar/art
		fi
		# Change to the album art directory
		cd ~/.config/pianobar/art
		# Get rid of any existing album art, but don't complain if there isn't any

    # TODO: Cache album art instead
		rm * 2> /dev/null

		# $coverArt is a URL pointing to the album art, so download it
		wget -q "$coverArt"

		# Finally, show the notification with the title, artist, album name, heart icon, and
		# album art image. We set the identifier (with the -d switch) to make all of the
		# notifications show in one bubble.
		echo "by: $artist"$'\n'"on: $album" | growlnotify --image * -d 12 "$heart$title"
	;;

  # Try to handle errors
  *)
    growlArgs="--image $iconPath -d 12 pianobar"

		if [ "$pRet" -ne 1 ]; then
      echo '$1 failed: $pRetStr' | growlnotify $growlArgs
		elif [ "$wRet" -ne 1 ]; then
      echo '$1 failed: Network error: $wRetStr' | growlnotify $growlArgs
		fi
  ;;
esac

