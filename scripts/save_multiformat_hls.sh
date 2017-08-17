#!/bin/bash

INPUTFILE="./hls_output/input.mp4"
OUTPUTFOLDER="./hls_output/input"

#Create folders
mkdir -p $OUTPUTFOLDER/exp/160p
mkdir -p $OUTPUTFOLDER/exp/240p
mkdir -p $OUTPUTFOLDER/exp/360p
mkdir -p $OUTPUTFOLDER/exp/480p
mkdir -p $OUTPUTFOLDER/exp/720p
mkdir -p $OUTPUTFOLDER/exp/1080p

#Copy index template
cp ./index_template.m3u8 $OUTPUTFOLDER/exp/index.m3u8

#First export huge file to all new quality's
ffmpeg -i $INPUTFILE -pix_fmt yuv420p -r 23.976 -vcodec libx264 -vf "scale=1920:1080" -b:v 3400k -preset veryfast -profile:v baseline -keyint_min 24 -g 48 -x264opts no-scenecut -strict experimental -acodec aac -b:a 96k -af "aresample=async=1:min_hard_comp=0.100000:first_pts=0" -map_metadata -1 -f mp4 $OUTPUTFOLDER/1080p.mp4 -pix_fmt yuv420p -r 23.976 -vcodec libx264 -vf "scale=1280:720" -b:v 1725k -preset veryfast -profile:v baseline -keyint_min 24 -g 48 -x264opts no-scenecut -strict experimental -acodec aac -b:a 96k -af "aresample=async=1:min_hard_comp=0.100000:first_pts=0" -map_metadata -1 -f mp4 $OUTPUTFOLDER/720p.mp4 -pix_fmt yuv420p -r 23.976 -vcodec libx264 -vf "scale=854:480" -b:v 960k -preset veryfast -profile:v baseline -keyint_min 24 -g 48 -x264opts no-scenecut -strict experimental -acodec aac -b:a 96k -af "aresample=async=1:min_hard_comp=0.100000:first_pts=0" -map_metadata -1 -f mp4 $OUTPUTFOLDER/480p.mp4 -pix_fmt yuv420p -r 23.976 -vcodec libx264 -vf "scale=480:360" -b:v 510k -preset veryfast -profile:v baseline -keyint_min 24 -g 48 -x264opts no-scenecut -strict experimental -acodec aac -b:a 96k -af "aresample=async=1:min_hard_comp=0.100000:first_pts=0" -map_metadata -1 -f mp4 $OUTPUTFOLDER/360p.mp4 -pix_fmt yuv420p -r 23.976 -vcodec libx264 -vf "scale=426:240" -b:v 320k -preset veryfast -profile:v baseline -keyint_min 24 -g 48 -x264opts no-scenecut -strict experimental -acodec aac -b:a 96k -af "aresample=async=1:min_hard_comp=0.100000:first_pts=0" -map_metadata -1 -f mp4 $OUTPUTFOLDER/240p.mp4 -pix_fmt yuv420p -r 23.976 -vcodec libx264 -vf "scale=284:160" -b:v 160k -preset veryfast -profile:v baseline -keyint_min 24 -g 48 -x264opts no-scenecut -strict experimental -acodec aac -b:a 96k -af "aresample=async=1:min_hard_comp=0.100000:first_pts=0" -map_metadata -1 -f mp4 $OUTPUTFOLDER/160p.mp4 -strict experimental -acodec aac -vn -b:a 96k -af "aresample=async=1:min_hard_comp=0.100000:first_pts=0" -f mp4 $OUTPUTFOLDER/AudioOnly.mp4

#Export new quality's to HLS format
ffmpeg -i $OUTPUTFOLDER/160p.mp4 -start_number 0 -hls_time 1 -hls_list_size 0 -f hls -strict -2 $OUTPUTFOLDER/exp/160p/index.m3u8
ffmpeg -i $OUTPUTFOLDER/240p.mp4 -start_number 0 -hls_time 1 -hls_list_size 0 -f hls -strict -2 $OUTPUTFOLDER/exp/240p/index.m3u8
ffmpeg -i $OUTPUTFOLDER/360p.mp4 -start_number 0 -hls_time 1 -hls_list_size 0 -f hls -strict -2 $OUTPUTFOLDER/exp/360p/index.m3u8
ffmpeg -i $OUTPUTFOLDER/480p.mp4 -start_number 0 -hls_time 1 -hls_list_size 0 -f hls -strict -2 $OUTPUTFOLDER/exp/480p/index.m3u8
ffmpeg -i $OUTPUTFOLDER/720p.mp4 -start_number 0 -hls_time 1 -hls_list_size 0 -f hls -strict -2 $OUTPUTFOLDER/exp/720p/index.m3u8
ffmpeg -i $OUTPUTFOLDER/1080p.mp4 -start_number 0 -hls_time 1 -hls_list_size 0 -f hls -strict -2 $OUTPUTFOLDER/exp/1080p/index.m3u8
