#!/bin/bash

ffmpeg -i https://d2zihajmogu5jn.cloudfront.net/bipbop-advanced/bipbop_16x9_variant.m3u8 -acodec copy -vcodec copy out.mp4
