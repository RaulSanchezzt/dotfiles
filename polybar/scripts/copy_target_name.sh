#!/bin/sh

# Copy Target Name
target=$(cat ~/.config/polybar/scripts/targetName)
echo -n "$target" | xclip -sel clipboard
