#!/bin/bash

mkdir bin
meson bin
cd bin
ninja
./src/ion
