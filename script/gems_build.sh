#!/bin/sh
pushd .
cd ..
gem build raylib-bindings-blend2d.gemspec
gem build raylib-bindings-blend2d.gemspec --platform arm64-darwin
gem build raylib-bindings-blend2d.gemspec --platform x86_64-darwin
gem build raylib-bindings-blend2d.gemspec --platform aarch64-linux
gem build raylib-bindings-blend2d.gemspec --platform x86_64-linux
gem build raylib-bindings-blend2d.gemspec --platform x64-mingw
popd
