#!/bin/sh

# Copy Target IP
target=$(cat ~/.config/polybar/scripts/targetIP)
echo -n "$target" | xclip -sel clipboard