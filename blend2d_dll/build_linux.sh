#!/bin/sh

arch=`uname -a`

mkdir -p build_$(arch)
cd build_$(arch)
cmake -D CMAKE_C_FLAGS="" -D CMAKE_BUILD_TYPE=Release -D CMAKE_C_COMPILER=clang -D BLEND2D_NO_JIT=1 ../blend2d
make
cp libblend2d.so ../../lib/libblend2d.$(arch).so
