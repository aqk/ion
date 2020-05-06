#!/bin/bash -x

set -e

msg() { echo -e "\x1b[1;32mINFO:  \x1b[37m$*\x1b[0m"; }

python --version

pyenv versions

if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
  msg "Running OSX setup"
  brew update
  brew install meson ninja
  if [[ "$MESON_ARGS" =~ .*unity=on.* ]]; then
    which pkg-config || brew install pkg-config
  fi
elif [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
  msg "Running Linux setup"
  #docker pull mesonbuild/bionic
  #pip install --user meson
  sudo apt-get -y install ninja-build
  pyenv global 3.8.1
  pip3 install meson
fi

msg "Setup finished"
