#!/bin/bash
#
# run a full build (requires repos to be already cloned via `update.sh`)
#
# WARNING: this can take over 10 hours (over 30.000 c++ sources to compile) !
# It's also patching lots of chromium sources, so incremental rebuild still
# triggers most sources to be recompiled.

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
    --tools-distrib \
    --no-debug-tests \
    --no-release-tests
