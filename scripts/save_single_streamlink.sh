#!/bin/bash

streamlink -O twitch.tv/esl_csgo best | ffmpeg -i - -acodec copy -vcodec copy ./streamlink_output.mp4
