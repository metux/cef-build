set -e

ROOT=`pwd`

CODE_DIR=$ROOT/code
DEPOT_TOOLS_DIR=$CODE_DIR/depot_tools

DEPOT_TOOLS_REPO="https://chromium.googlesource.com/chromium/tools/depot_tools.git"
DEPOT_TOOLS_BRANCH="main"

#CEF_REPO="https://bitbucket.org/chromiumembedded/cef.git"
CEF_REPO="https://github.com/metux/cef-suckless"
CEF_BRANCH="master"

CHROMIUM_UPSTREAM_REPO="https://chromium.googlesource.com/chromium/src.git"
CHROMIUM_UPSTREAM_TAG="142.0.7444.0"
CHROMIUM_BRANCH="cef_142.0.7444.0"
CHROMIUM_WORKDIR="$ROOT/code/chromium_git/chromium/src"

if [ "$ANONYMOUS" ]; then
    CHROMIUM_MTX_REPO=https://github.com/metux//cef-chromium.git
else
    CHROMIUM_MTX_REPO=git@github.com:metux/cef-chromium.git
fi
