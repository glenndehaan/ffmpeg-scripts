#!/bin/bash

streamlink -O twitch.tv/esl_csgo best | ffmpeg -i - -codec copy -map 0:0 -map 0:1 -f segment -segment_time 30 -reset_timestamps 1 -strftime 1 ./%Y-%m-%d_%H%M%S_segment.mp4
