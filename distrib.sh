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

( cd /code/chromium_git/chromium/src/cef/binary_distrib && \
  tar -xjfv cef.tar.bz2 cef_binary_*_linux64 )
