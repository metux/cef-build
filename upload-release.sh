#!/bin/bash

set -e

BINARY_DIR=./code/chromium_git/chromium/src/cef/binary_distrib
DOWNLOAD_DIR=tmp

RELEASE="2026-01-12-01"

die() {
    echo "ERR: $*" >&2
    exit 1
}

FN=`echo $BINARY_DIR/cef_binary_*_linux64.tar.bz2`
BN=`basename "$FN"`

echo "Using CEF tarball: $FN"

[ -f "$FN" ] || die "cant find tarball file: $FN"

UPLOAD_FILE=cef_binary-$RELEASE.tar.bz2

rm -Rf tmp
mkdir -p tmp

cp $FN tmp/$UPLOAD_FILE

gh release create $RELEASE tmp/$UPLOAD_FILE \
    --repo metux/cef-chromium \
    --title "prebuilt CEF binary: $RELEASE" \
    --notes "built locally"
