#!/bin/sh
pushd .
cd ..
for i in `ls raylib-bindings-blend2d-*.gem`; do
    echo gem push $i
done
popd
