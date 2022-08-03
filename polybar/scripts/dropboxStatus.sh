#!/bin/bash

STATUS="$(echo `dropbox status 2>/dev/null` | awk '{print $1" "$2" "$3" "$4;}')"
SPACE=' '

echo "$SPACE $STATUS"
