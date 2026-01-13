#!/usr/bin/env bash
set -euo pipefail

PATCHLINE="${PATCHLINE:-release}"
OUT_ZIP="${OUT_ZIP:-/cache/game.zip}"

mkdir -p /cache /dist

echo "Hytale Downloader"
echo "Patchline: $PATCHLINE"
echo "Output:    $OUT_ZIP"

cd /cache

hytale-downloader \
  -download-path "$OUT_ZIP" \
  -patchline "$PATCHLINE" \
  -skip-update-check

echo "Download complete."

rm -rf /dist/*
unzip -o "$OUT_ZIP" -d /dist

echo "Extracted files:"
ls -la /dist | head -200
