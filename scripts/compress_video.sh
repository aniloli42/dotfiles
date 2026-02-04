#!/usr/bin/env bash
# Usage: ./compress_video.sh input.mp4 [output.mp4]

set -euo pipefail

IN="${1:?Provide an input file, e.g. input.mp4}"
OUT="${2:-compressed.mp4}"

ffmpeg -hide_banner -y -i "$IN" \
	-map 0:v:0 -map 0:a? -map 0:s? \
	-c:v libx264 -preset slow -crf 20 -pix_fmt yuv420p \
	-c:a aac -b:a 160k \
	-movflags +faststart \
	"$OUT"
