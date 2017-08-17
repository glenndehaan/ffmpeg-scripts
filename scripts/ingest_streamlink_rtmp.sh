#!/bin/bash

streamlink -O twitch.tv/esl_csgo best | ffmpeg -i - -c copy -acodec aac -ab 128k -g 50 -strict experimental -f flv rtmp://localhost/ingest/esl_csgo
