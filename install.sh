#!/bin/bash

if [ ! -d ~/.config/pianobar/ ]
then
	mkdir -p ~/.config/pianobar/
fi

chmod +x growl.sh

cp growl.sh ~/.config/pianobar/
cp pandora-icon-cc-by-sa-rossr.png ~/.config/pianobar

echo "event_command = $HOME/.config/pianobar/growl.sh" >> ~/.config/pianobar/config

echo Installed successfully!
