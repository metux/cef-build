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
export CEF_ARCHIVE_FORMAT=tar.bz2

( cd code/chromium_git/chromium/src/cef && git remote update && git checkout -f origin/$CEF_BRANCH )

rm -Rf ./code/chromium_git/chromium/src/cef/binary_distrib
mkdir -p ./code/chromium_git/chromium/src/cef/binary_distrib

if [ ! -f code/chromium_git/chromium/src/build/util/LASTCHANGE.committime ]; then
    echo "--> need to create code/chromium_git/chromium/src/build/util/LASTCHANGE.committime"
    echo -n "1759201371" > code/chromium_git/chromium/src/build/util/LASTCHANGE.committime
fi

notify-send "CEF compile starting" -a "CEF BUILD" -e || true

if python3 \
    $ROOT/automate-git.py \
    --download-dir=$ROOT/code/chromium_git \
    --depot-tools-dir=$ROOT/code/depot_tools \
    --minimal-distrib \
    --x64-build \
    --force-build \
    --no-update \
    --no-debug-build \
    --url="$CEF_REPO" \
    --checkout="$CEF_BRANCH" \
    --build-log-file \
    --force-distrib \
    --tools-distrib \
    --no-debug-tests \
    --no-release-tests ; \
then
    echo "---> build succeed"
    notify-send "CEF compile finished: OKAY" -a "CEF BUILD" -e || true
else
    echo "---> build failed"
    notify-send "CEF compile finished: FAILED" -a "CEF BUILD" -e || true
fi
