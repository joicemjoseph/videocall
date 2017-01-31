#!/bin/bash -e

serverIp=192.168.0.30

gst-launch-1.0 -v udpsrc port=6001 caps="application/x-rtp" \
! queue ! rtppcmudepay ! mulawdec ! audioconvert ! autoaudiosink sync=false &

gst-launch-1.0 -v tcpclientsrc host=$serverIp port=6000 \
! gdpdepay ! rtph264depay ! avdec_h264 ! videoconvert ! autovideosink sync=false

kill $!
