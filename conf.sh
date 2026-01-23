set -e

ROOT=`pwd`

CODE_DIR=$ROOT/code
DEPOT_TOOLS_DIR=$CODE_DIR/depot_tools

DEPOT_TOOLS_REPO="https://chromium.googlesource.com/chromium/tools/depot_tools.git"
DEPOT_TOOLS_BRANCH="main"

CEF_REPO="https://github.com/metux/cef-suckless"
CEF_BRANCH="suckless-145.0.7632.0"

CHROMIUM_UPSTREAM_REPO="https://chromium.googlesource.com/chromium/src.git"
CHROMIUM_UPSTREAM_TAG="145.0.7632.0"
CHROMIUM_BRANCH="cef_145.0.7632.0"
CHROMIUM_WORKDIR="$ROOT/code/chromium_git/chromium/src"

# used by our upload-release.sh script
CEFSDK_RELEASE="2026-01-21-01"

if [ "$ANONYMOUS" ]; then
    CHROMIUM_MTX_REPO=https://github.com/metux//cef-chromium.git
else
    CHROMIUM_MTX_REPO=git@github.com:metux/cef-chromium.git
fi
