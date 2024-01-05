::
:: For Windows + RubyInstaller2 with DevKit(MSYS2 gcc & make) + CMake users.
:: - Use this script after "ridk enable"d. See https://github.com/oneclick/rubyinstaller2/wiki/The-ridk-tool for details.
::
:: Usage
:: > ridk enable
:: > build_windows.cmd  <- %PROGRAMFILES%\CMake\bin\cmake.exe will be used.
:: > build_windows.cmd "D:\Program Files\CMake\bin\cmake.exe" <- You can give full path to 'cmake.exe'.

@echo off
setlocal enabledelayedexpansion
set CMAKE_EXE=%1
if %CMAKE_EXE% == "" (
    set CMAKE_EXE="%PROGRAMFILES%\CMake\bin\cmake"
)

pushd %~dp0
if not exist build (
    mkdir build
)
cd build
%CMAKE_EXE% -G "MSYS Makefiles" -D CMAKE_BUILD_TYPE=Release -D CMAKE_C_COMPILER=gcc -D BLEND2D_NO_JIT=1 ../blend2d
make
copy libblend2d.dll ..\..\lib
popd
