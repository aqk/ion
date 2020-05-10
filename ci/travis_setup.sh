#!/bin/bash -x

set -e

msg() { echo -e "\x1b[1;32mINFO:  \x1b[37m$*\x1b[0m"; }

python --version

pyenv versions

if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
  msg "Running OSX setup"
  #brew update
  export HOMEBREW_NO_INSTALL_CLEANUP=1
  brew install meson@0.54.1 ninja
  if [[ "$MESON_ARGS" =~ .*unity=on.* ]]; then
    which pkg-config || brew install pkg-config
  fi
elif [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
  msg "Running Linux setup"
  # Update must be called, otherwise apt won't know ninja-build package exists
  sudo apt update
  sudo apt-get -y install ninja-build
  pyenv global 3.8.1
  pip3 install meson
fi

msg "Setup finished"
