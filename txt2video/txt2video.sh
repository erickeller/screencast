#!/bin/bash

usage()
{
echo "usage: $0 'text' video_length_in_sec

example:
$0 'hello world' 5
"
}

if [ $# -ne 2 ]
then
  usage
  exit 1
fi

OUTPUT_TEXT=$1
VIDEO_LENGTH=$2

echo "generating ${VIDEO_LENGTH} s video from ${OUTPUT_TEXT}"

exit 0
