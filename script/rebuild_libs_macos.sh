pushd .
cd ../blend2d_dll
rm -r -f build_x86_64
rm -r -f build_arm64
./build_macos.sh
popd
