#!/bin/bash

set -e

ROOT=`pwd`

export GCLIENT_SHALLOW=1
export GN_DEFINES_VERBOSE=1

python3 \
    $ROOT/automate-git.py \
    --download-dir=$ROOT/code/chromium_git \
    --depot-tools-dir=$ROOT/code/depot_tools \
    --no-distrib \
    --x64-build \
    --force-build
