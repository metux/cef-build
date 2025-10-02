set -e

ROOT=`pwd`

CODE_DIR=$ROOT/code
DEPOT_TOOLS_DIR=$CODE_DIR/depot_tools

DEPOT_TOOLS_REPO="https://chromium.googlesource.com/chromium/tools/depot_tools.git"
DEPOT_TOOLS_BRANCH="main"

#CEF_REPO="https://bitbucket.org/chromiumembedded/cef.git"
CEF_REPO="https://github.com/metux/cef-suckless"
CEF_BRANCH="master"

CHROMIUM_REPO="https://chromium.googlesource.com/chromium/src.git"
CHROMIUM_BRANCH="main"
CHROMIUM_WORKDIR="$ROOT/code/chromium_git/chromium/src"
