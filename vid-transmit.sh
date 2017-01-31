#!/bin/bash -e

gst-launch-1.0 -v alsasrc device=plughw:1,0 \
! mulawenc ! rtppcmupay ! udpsink host=192.168.0.9 port=6001 &


gst-launch-1.0 -v v4l2src device=/dev/video0 ! 'video/x-raw,width=640,height=480' ! x264enc ! rtph264pay config-interval=1 pt=96 ! gdppay ! tcpserversink host=192.168.0.9 port=6000
