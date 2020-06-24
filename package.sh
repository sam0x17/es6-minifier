#!/bin/bash
cd js || exit 1
npm install -g pkg || exit 1
npm install --save terser || exit 1
pkg minify.js --out-path ../dist
