#!/bin/bash

pushd "$(dirname $0)/../" > /dev/null

read -r -p "Are you sure you want to delete everything? [y/N] " response
if [[ "${response}" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "=> Deleting repositories and build artifacts"
    rm -rf "./swift" "./llvm" "./clang" "./lldb" "./cmark" "./llbuild" "./swiftpm" "./swift-corelibs-xctest" "./swift-corelibs-foundation" "./swift-integration-tests" "./swift-corelibs-libdispatch" "./swift-xcode-playground-support" "./compiler-rt" "./ninja"
    rm -rf "./build" "./install" "./swift.tar.gz"
    echo "=> Done"
else
    echo "=> Nothing deleted"
fi

popd > /dev/null
