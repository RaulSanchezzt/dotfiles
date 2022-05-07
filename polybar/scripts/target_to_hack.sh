#!/bin/sh

target=$(cat ~/.config/polybar/scripts/target)

if [ $target ]; then
    echo "什 $target"
else
    echo "ﱾ"
fi
