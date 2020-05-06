#!/bin/bash -x

mkdir bin
meson bin
cd bin
ninja
./src/ion
