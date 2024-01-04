#!/bin/sh
export MACOSX_DEPLOYMENT_TARGET=14.0

mkdir -p build_x86_64
cd build_x86_64
cmake -D CMAKE_C_FLAGS="" -D CMAKE_BUILD_TYPE=Release -D CMAKE_OSX_ARCHITECTURES="x86_64" -D CMAKE_C_COMPILER=clang -D BLEND2D_NO_JIT=1 ../blend2d
make
cp libblend2d.dylib ../../lib/libblend2d.x86_64.dylib

cd ..

mkdir -p build_arm64
cd build_arm64
cmake -D CMAKE_C_FLAGS="" -D CMAKE_BUILD_TYPE=Release -D CMAKE_OSX_ARCHITECTURES="arm64" -D CMAKE_C_COMPILER=clang -D BLEND2D_NO_JIT=1 ../blend2d
make
cp libblend2d.dylib ../../lib/libblend2d.arm64.dylib
