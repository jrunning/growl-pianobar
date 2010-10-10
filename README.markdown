## Overview

`growl-pianobar` is a shell script that displays a [growl][1] notification when the current song on [pianobar][2] changes.

## Usage

`growl-pianobar` should never be invoked directly. But should instead be referenced in pianobar's configuration file.

## Installation

1. Create a file called config in ~/.config/pianobar/
2. Open the file in your favorite text editor and insert the text:

	`event_command = path/to/growl.sh`

Where `path/to/growl.sh` is the location of the `growl.sh` file.

Now when you run pianobar and the song changes, you should be notified via growl of the current song.

## Compatibility

`growl-pianobar` is compatible with Mac OS X. You need to have [growlnotify][3] installed.

[1]: http://growl.info
[2]: http://github.com/PromyLOPh/pianobar
[3]: http://growl.info/extras.php
