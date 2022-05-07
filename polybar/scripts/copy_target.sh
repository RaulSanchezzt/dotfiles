#!/bin/sh

# Copy Target IP
target=$(cat ~/.config/polybar/scripts/target)
echo -n "$target" | xclip -sel clipboard
