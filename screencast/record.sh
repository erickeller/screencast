#!/bin/sh
RECORDING_DELAY=5
OUTPUT=test

recordmydesktop --windowid `xwininfo | awk '/Window id:/ {print $4}'` -o ${OUTPUT}.ogv --delay ${RECORDING_DELAY} --no-sound &
echo "stop recording:
kill -s TERM $!"

