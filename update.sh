#!/bin/bash

set -e

ROOT=`pwd`

CODE_DIR=$ROOT/code
DEPOT_TOOLS_DIR=$CODE_DIR/depot_tools

DEPOT_TOOLS_REPO="https://chromium.googlesource.com/chromium/tools/depot_tools.git"
DEPOT_TOOLS_BRANCH="main"

CEF_REPO="https://bitbucket.org/chromiumembedded/cef.git"
CEF_BRANCH="master"

CHROMIUM_REPO="https://chromium.googlesource.com/chromium/src.git"
CHROMIUM_BRANCH="main"
CHROMIUM_WORKDIR="$ROOT/code/chromium_git/chromium/src"

clone_pkg_single() {
    local prefix="$1"
    local name="$2"
    local repo="$3"
    local branch="$4"

    echo "cloning package: $name"
    echo "repo: $repo"

    mkdir -p $prefix
    (
        cd $prefix
        if [ ! -f $name/.git/config ]; then
            git clone --depth=1 --branch $branch --single-branch $repo $name
        fi
    )
}

#clone_pkg_single $CODE_DIR              depot_tools $DEPOT_TOOLS_REPO $DEPOT_TOOLS_BRANCH
#clone_pkg_single $CODE_DIR/chromium_git cef         $CEF_REPO         $CEF_BRANCH
## clone_pkg_single $CODE_DIR/chromium_git chromium-1  $CHROMIUM_REPO    $CHROMIUM_BRANCH

#awk '{print $2}' $ROOT/chromium-fetch-tags | ( \
#    cd $CHROMIUM_WORKDIR
#    ls -la
#    while read ref ; do
#        echo "REF: $ref"
#        git fetch --depth=1 origin "$ref:$ref"
#    done
#)

(
    echo "fetching refs/tags/141.0.7390.0"
    cd $CHROMIUM_WORKDIR
    if ! git rev-parse -q --verify "refs/tags/141.0.7390.0" >/dev/null; then
        git fetch --depth=1 origin refs/tags/141.0.7390.0:refs/tags/141.0.7390.0
    fi
)

# mkdir $CHROMIUM_WORKDIR/thirdparty
# clone_pkg_single $CHROMIUM_WORKDIR/thirdparty

export GCLIENT_SHALLOW=1

#exit 1

python3 \
    $ROOT/automate-git.py \
    --download-dir=$ROOT/code/chromium_git \
    --depot-tools-dir=$ROOT/code/depot_tools \
    --no-distrib \
    --no-build

## compress
# third_party/boringssl --> which commit ?
