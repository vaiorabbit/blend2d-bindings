arch=`uname -a`
pushd .
cd ../blend2d_dll
rm -r -f build_$(arch)
./build_linux.sh
popd
