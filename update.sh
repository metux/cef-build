#!/bin/bash
#
# Special magic for cloning the sources step by step
# (just cloning - for building use `build.sh`)
#
# Has to be so complicated, because otherwise automate-git.py will try
# to clone >100GB at once, which usually fails due network problems
# as well as load limiting on Google's servers
#
# It really smells like the whole thing isn't supposed to be built
# from outside of Google :o
#
# Note: re-running this usually ends up in full rebuild (>10 hours)

set -e

ROOT=`pwd`

. conf.sh

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
clone_pkg_single $CODE_DIR/chromium_git/chromium src $CHROMIUM_REPO    $CHROMIUM_BRANCH
clone_pkg_single $CODE_DIR/chromium_git/chromium/src cef $CEF_REPO         $CEF_BRANCH

# add upstream to our work clone
(
    cd $CODE_DIR/chromium_git/cef
    git remote add upstream https://bitbucket.org/chromiumembedded/cef.git || true
    git remote update upstream
)

# only fetching the chromium tags that CEF wants to build against
# needs to be adapted for newer CEF revisions
(
    cd $CHROMIUM_WORKDIR
    if ! git rev-parse -q --verify "refs/tags/142.0.7444.0" >/dev/null; then
        git fetch --depth=1 origin refs/tags/142.0.7444.0:refs/tags/142.0.7444.0
    fi
)

export GCLIENT_SHALLOW=1

python3 \
    $ROOT/automate-git.py \
    --download-dir=$ROOT/code/chromium_git \
    --depot-tools-dir=$ROOT/code/depot_tools \
    --no-distrib \
    --no-build \
    --url="$CEF_REPO"
