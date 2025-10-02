#!/bin/bash

ROOT=$HOME/src/netcom/cef-build

python3 \
    ../automate/automate-git.py \
    --download-dir=$ROOT/code/chromium_git \
    --depot-tools-dir=$ROOT/code/depot_tools \
    --no-distrib \
    --no-build
