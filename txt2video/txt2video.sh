#!/bin/bash

usage()
{
echo "usage: $0 'text' video_length_in_sec

example:
$0 'hello world' 5
"
}

if [ $# -lt 2 ]
then
  usage
  exit 1
fi


OUTPUT_TEXT=$1
#OUTPUT_IMG=$(awk -F: '$0=$1' <<<"${OUTPUT_TEXT}")
OUTPUT_NAME=`echo ${OUTPUT_TEXT} | cut -c 1-6 | tr ' ' '_'`
OUTPUT_IMG="${OUTPUT_NAME}.png"
#LOGO_IMG=logo.png
#WATERMARK_IMG="${OUTPUT_NAME}.watermarked.png"
if [ $# -eq 3 ]
then
  OUTPUT_VIDEO=${3}.avi
else
  OUTPUT_VIDEO="${OUTPUT_NAME}.avi"
fi
VIDEO_LENGTH=$2
RATIO=1280x720

echo "generating image: ${OUTPUT_IMG} from text: ${OUTPUT_TEXT}"
convert -size ${RATIO} xc:white -font FreeMono-Regular -pointsize 72 -fill black  -gravity center caption:"${OUTPUT_TEXT}" -flatten ${OUTPUT_IMG}
echo "Watermark ${OUTPUT_IMG} image with ${LOGO_IMG} logo"
#composite -gravity NorthEast ${LOGO_IMG} ${OUTPUT_IMG} ${WATERMARK_IMG}
echo "generating ${VIDEO_LENGTH} s video from ${OUTPUT_TEXT} with ${OUTPUT_IMG}"
avconv -f image2 -i ${OUTPUT_IMG} -r "1/${VIDEO_LENGTH}" -s "${RATIO}" ${OUTPUT_VIDEO} -t "00:00:${VIDEO_LENGTH}"
exit 0
