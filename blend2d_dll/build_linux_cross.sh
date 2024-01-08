#!/bin/sh

export ARCH=aarch64

mkdir -p build_${ARCH}
cd build_${ARCH}
cmake -D CMAKE_C_FLAGS=-isystem\ /usr/aarch64-linux-gnu/include -D CMAKE_BUILD_TYPE=Release -D CMAKE_C_COMPILER_TARGET=aarch64-linux-gnu -D CMAKE_SYSTEM_PROCESSOR=ARM -D BUILD_SHARED_LIBS=ON -D CROSS_BUILD_PLATFORM=${ARCH} -D CMAKE_CXX_COMPILER=aarch64-linux-gnu-g++ cmake -D CMAKE_C_FLAGS="" -D CMAKE_BUILD_TYPE=Release -D CMAKE_C_COMPILER=clang -D BLEND2D_NO_JIT=1 ../blend2d
make

cp libblend2d.so ../../lib/libblend2d.$(arch).so
