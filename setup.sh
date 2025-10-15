#!/bin/bash

sudo apt-get install curl file lsb-release procps python3 python3-pip
sudo apt-get install \
  binutils \
  bison \
  bzip2 \
  curl \
  devscripts \
  elfutils \
  fakeroot \
  fd-find \
  flex \
  gperf \
  libasound2-dev \
  libatspi2.0-dev \
  libbz2-dev \
  libcairo2-dev \
  libcap-dev \
  libcgi-session-perl \
  libcurl4-gnutls-dev \
  libdrm-dev \
  libelf-dev \
  libffi-dev \
  libgbm-dev \
  libglu1-mesa-dev \
  libgtk-3-dev \
  libjpeg-dev \
  libnspr4-dev \
  libnss3-dev \
  libpulse-dev \
  libsctp-dev \
  libsqlite3-dev \
  libssl-dev \
  libvulkan-dev \
  libwww-perl \
  libxkbcommon-dev \
  libxshmfence-dev \
  libxslt1-dev \
  libxss-dev \
  mesa-common-dev \
  patch \
  perl \
  pkgconf \
  ripgrep \
  uuid-dev \
  wdiff \
  xvfb \
  xz-utils \
  libcups2-dev

exit 1

mkdir -p code
mkdir -p code/automate
mkdir -p code/chromium_git

#(
#    cd ~/code
#    curl 'https://chromium.googlesource.com/chromium/src/+/main/build/install-build-deps.py?format=TEXT' | base64 -d > install-build-deps.py
#    python3 ./install-build-deps.py --no-arm --no-chromeos-fonts --no-nacl
#    python3 -m pip install dataclasses importlib_metadata
#)

#(
#    cd ~/code
#    if [ ! -f depot_tools.git/.git/config ]; then
#        git clone --depth 1 https://chromium.googlesource.com/chromium/tools/depot_tools.git
#    fi
#)

#mkdir -p code/automate
#curl https://bitbucket.org/chromiumembedded/cef/raw/master/tools/automate/automate-git.py > code/automate
