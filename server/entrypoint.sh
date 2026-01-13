#!/usr/bin/env bash
set -euo pipefail

SERVER_DIR="${SERVER_DIR:-/opt/hytale/Server}"
ASSETS_PATH="${ASSETS_PATH:-/opt/hytale/Assets.zip}"

JAR_PATH="${SERVER_DIR}/HytaleServer.jar"

if [[ ! -f "$JAR_PATH" ]]; then
  echo "ERROR: Missing $JAR_PATH"
  echo "Check your dist/ folder layout and mounts."
  exit 1
fi

if [[ ! -f "$ASSETS_PATH" ]]; then
  echo "ERROR: Missing $ASSETS_PATH"
  echo "Check your dist/ folder layout and mounts."
  exit 1
fi

BIND_ADDR="${BIND_ADDR:-0.0.0.0}"
BIND_PORT="${BIND_PORT:-5520}"
XMS="${XMS:-2G}"
XMX="${XMX:-4G}"
EXTRA_ARGS="${EXTRA_ARGS:-}"

echo "Starting Hytale Server"
echo "JAR:     $JAR_PATH"
echo "Assets:  $ASSETS_PATH"
echo "Bind:    $BIND_ADDR:$BIND_PORT"
echo "Memory:  $XMS -> $XMX"

cd /data

exec java \
  -Xms"$XMS" -Xmx"$XMX" \
  -jar "$JAR_PATH" \
  --assets "$ASSETS_PATH" \
  --bind "$BIND_ADDR:$BIND_PORT" \
  $EXTRA_ARGS
