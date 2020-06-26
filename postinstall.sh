#!/bin/sh
mkdir -p bin || exit 1
case $OSTYPE in
  "linux-gnu"*) MINIFIER_BIN=linux ;;
  "darwin"*)    MINIFIER_BIN=macos ;;
esac
if [ -e /etc/os-release ]; then
  . /etc/os-release
  case $ID in
    "alpine"*) MINIFIER_BIN=alpine ;;
    *) MINIFIER_BIN=linux ;;
  esac
fi
echo "$MINIFIER_BIN detected, downloading minifier binary..."
if type wget > /dev/null; then
  wget https://github.com/sam0x17/es6-minifier/releases/download/0.1.3/minify-$MINIFIER_BIN -O bin/es6-minifier || exit 1
elif type curl > /dev/null; then
  curl -L --url https://github.com/sam0x17/es6-minifier/releases/download/0.1.2/minify-$MINIFIER_BIN --output bin/es6-minifier || exit 1
else
  echo "error: neither curl nor wget could be found!"
  exit 1
fi
chmod +x bin/es6-minifier
