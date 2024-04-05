#!/bin/sh

kill -9 $(pidof mjpg_streamer)
kill -9 $(fuser /dev/video4)
kill -9 $(fuser /dev/video5)
kill -9 $(fuser /dev/video6)


/opt/bin/mjpg_streamer -b -i "/opt/lib/mjpg-streamer/input_uvc.so -d /dev/video5  -q 40  -r 1080x720 -f 25" -i "/opt/lib/mjpg-streamer/input_uvc.so -d /dev/video4 -q 40  -r 1080x720 -f 25" -o "/opt/lib/mjpg-streamer/output_http.so -p 8080"
