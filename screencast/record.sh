#!/bin/sh
RECORDING_DELAY=5
if [ $# -eq 1 ]
then
  OUTPUT=${1}
else
  OUTPUT=mydesktop
fi

recordmydesktop --windowid `xwininfo | awk '/Window id:/ {print $4}'` -o ${OUTPUT}.ogv --delay ${RECORDING_DELAY} --no-sound &
echo "stop recording:
pause recording: CTRL+ALT+p
stop recording: CTRL+ALT+s
kill -s TERM $!"

