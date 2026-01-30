#!/bin/bash

set -e

. conf.sh

BINARY_DIR=./code/chromium_git/chromium/src/cef/binary_distrib
DOWNLOAD_DIR=tmp

die() {
    echo "ERR: $*" >&2
    exit 1
}

FN=`echo $BINARY_DIR/cef_binary_*_linux64.tar.bz2`
BN=`basename "$FN"`

echo "Using CEF tarball: $FN"

[ -f "$FN" ] || die "cant find tarball file: $FN"

UPLOAD_FILE="cef_binary-$CEFSDK_RELEASE.tar.bz2"

rm -Rf tmp
mkdir -p tmp

cp $FN tmp/$UPLOAD_FILE

gh release create "$CEFSDK_RELEASE" "tmp/$UPLOAD_FILE" \
    --repo metux/cef-chromium \
    --title "prebuilt CEF binary: $CEFSDK_RELEASE" \
    --notes "built locally"
