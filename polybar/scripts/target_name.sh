#!/bin/sh

target=$(cat ~/.config/polybar/scripts/targetName)

if [ $target ]; then
    echo "$target"
else
    echo ""
fi
