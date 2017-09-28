#!/bin/bash

LIVEURL="http://astreamingsite.com/path/to/hls/folder/master.m3u8"

streamlink -O hlsvariant://$LIVEURL best | ffmpeg -i - -codec copy -map 0:0 -map 0:1 -bsf:a aac_adtstoasc -f segment -segment_time 30 -reset_timestamps 1 -strftime 1 ./%Y-%m-%d_%H%M%S_segment.mp4
