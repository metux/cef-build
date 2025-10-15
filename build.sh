#!/bin/bash

set -e

ROOT=`pwd`

export GCLIENT_SHALLOW=1

mkdir -p ./code/chromium_git/chromium/src/out/Debug_GN_x86

python3 \
    $ROOT/automate-git.py \
    --download-dir=$ROOT/code/chromium_git \
    --depot-tools-dir=$ROOT/code/depot_tools \
    --no-distrib \
    --force-build

