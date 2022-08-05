#!/bin/bash

STATUS="$(echo `dropbox status 2>/dev/null` | awk '{print $1;}')"
SPACE=' '

echo "$SPACE $STATUS"
