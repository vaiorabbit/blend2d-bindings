pushd .
cd ../blend2d_dll
rm -r -f build_aarch64
./build_linux_cross.sh
popd
