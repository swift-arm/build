#!/bin/bash

REPOS="clang compiler-rt llvm cmark llbuild swift-corelibs-foundation swift-corelibs-xctest swiftpm lldb swift swift-corelibs-libdispatch  swift-integration-tests swift-xcode-playground-support"

for repo in $REPOS
do
  pushd $repo
    echo Pushing changes to Swift-Arm
    git push origin
  popd
done

