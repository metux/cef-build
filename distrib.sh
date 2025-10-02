#!/bin/bash
#
# create distribution tarball
# (run it after full build via `build.sh`)
#

set -e

. conf.sh

MY_ROOT=`pwd`

python ./code/chromium_git/chromium/src/cef/tools/make_distrib.py \
    --output-dir=./code/chromium_git/chromium/src/out/Release_GN_x64/ \
    --ninja-build \
    --x64-build \
    --no-format
