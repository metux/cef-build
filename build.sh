#!/bin/bash

set -e

ROOT=`pwd`

. conf.sh

export GCLIENT_SHALLOW=1
export GN_DEFINES_VERBOSE=1

python3 \
    $ROOT/automate-git.py \
    --download-dir=$ROOT/code/chromium_git \
    --depot-tools-dir=$ROOT/code/depot_tools \
    --minimal-distrib \
    --x64-build \
    --force-build \
    --no-update \
    --no-debug-build \
    --url="$CEF_REPO" \
    --branch="$CEF_BRANCH" \
    --build-log-file \
    --force-distrib \
    --tools-distrib
