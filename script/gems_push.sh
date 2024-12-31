#!/bin/sh
pushd .
cd ..
for i in `ls blend2d-bindings-*.gem`; do
    echo gem push $i
done
popd
