#!/bin/bash

set -e

# ROOT=$HOME/src/netcom/cef-build
# ROOT=/media/stick2/dev/cef-build

ROOT=`pwd`

CODE_DIR=$ROOT/code
DEPOT_TOOLS_DIR=$CODE_DIR/depot_tools

DEPOT_TOOLS_REPO="https://chromium.googlesource.com/chromium/tools/depot_tools.git"
DEPOT_TOOLS_BRANCH="master"

CEF_REPO="https://bitbucket.org/chromiumembedded/cef.git"
CEF_BRANCH="master"

CHROMIUM_REPO="https://chromium.googlesource.com/chromium/src.git"
CHROMIUM_BRANCH="main"

# clone depot_tools
#(
#    echo "clone depot_tools"
#    mkdir -p $CODE_DIR
#    cd $CODE_DIR
#    pwd
#    if [ ! -f depot_tools/.git/config ]; then
#        git clone --depth 1 "$DEPOT_TOOLS_REPO"
#    fi
#)

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

clone_pkg_single $CODE_DIR              depot_tools $DEPOT_TOOLS_REPO $DEPOT_TOOLS_BRANCH
clone_pkg_single $CODE_DIR/chromium_git cef         $CEF_REPO         $CEF_BRANCH
clone_pkg_single $CODE_DIR/chromium_git chromium-1  $CHROMIUM_REPO    $CHROMIUM_BRANCH

# clone cef
#(
#    mkdir -p $CODE_DIR/chromium_git
#    cd $CODE_DIR/chromium_git
#    if [ ! -f cef/.git/config ]; then
#        git clone --depth=1 --branch $CEF_BRANCH --single-branch $CEF_REPO
#    fi
#)

export GCLIENT_SHALLOW=1

exit 1

python3 \
    $ROOT/automate-git.py \
    --download-dir=$ROOT/code/chromium_git \
    --depot-tools-dir=$ROOT/code/depot_tools \
    --no-distrib \
    --no-build

## compress
# third_party/boringssl --> which commit ?
