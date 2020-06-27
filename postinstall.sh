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
VERSION=v0.1.4
if type wget > /dev/null; then
  wget https://github.com/sam0x17/es6-minifier/releases/download/$VERSION/minify-$MINIFIER_BIN -O bin/es6-minifier || exit 1
elif type curl > /dev/null; then
  curl -L --url https://github.com/sam0x17/es6-minifier/releases/download/$VERSION/minify-$MINIFIER_BIN --output bin/es6-minifier || exit 1
else
  echo "neither wget nor curl were found, attempting to install wget"
  apk add wget || apt-get update && apt-get install wget -y || yum install wget || exit 1
  wget https://github.com/sam0x17/es6-minifier/releases/download/$VERSION/minify-$MINIFIER_BIN -O bin/es6-minifier || exit 1
fi
chmod +x bin/es6-minifier
