@echo off
pushd %CD%
cd ..
call gem.cmd build raylib-bindings-blend2d.gemspec
call gem.cmd build raylib-bindings-blend2d.gemspec --platform arm64-darwin
call gem.cmd build raylib-bindings-blend2d.gemspec --platform x86_64-darwin
call gem.cmd build raylib-bindings-blend2d.gemspec --platform aarch64-linux
call gem.cmd build raylib-bindings-blend2d.gemspec --platform x86_64-linux
call gem.cmd build raylib-bindings-blend2d.gemspec --platform x64-mingw
popd
