#!/bin/sh

target=$(cat ~/.config/polybar/scripts/targetIP)

if [ $target ]; then
    echo "$target"
else
    echo ""
fi
