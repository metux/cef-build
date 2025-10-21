#!/bin/bash

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
    if ! git rev-parse -q --verify "refs/tags/142.0.7444.0" >/dev/null; then
        git fetch --depth=1 origin refs/tags/142.0.7444.0.0:refs/tags/142.0.7444.0
    fi
)

# mkdir $CHROMIUM_WORKDIR/thirdparty
# clone_pkg_single $CHROMIUM_WORKDIR/thirdparty

export GCLIENT_SHALLOW=1

# exit 1

python3 \
    $ROOT/automate-git.py \
    --download-dir=$ROOT/code/chromium_git \
    --depot-tools-dir=$ROOT/code/depot_tools \
    --no-distrib \
    --no-build \
    --url="$CEF_REPO"

echo "automate-git.py finished"

## compress
# third_party/boringssl --> which commit ?
