#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  MINIFIER_BIN=linux
elif [[ "$OSTYPE" == "darwin"* ]]; then
  MINIFIER_BIN=macos
fi
echo "$MINIFIER_BIN detected, downloading minifier binary..."
curl -L --url https://github.com/sam0x17/es6-minifier/releases/download/minify-dist/minify-$MINIFIER_BIN --output dist/minify || exit 1
chmod +x dist/minify || exit 1
