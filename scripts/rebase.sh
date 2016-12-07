#!/bin/bash

# Repos that use stable
REPOS="clang compiler-rt"

for repo in $REPOS
do
  pushd $repo
    echo Attempting to rebase $repo
    git fetch apple
    git rebase apple/stable
  popd
done

# Repos that use master
REPOS="cmark llbuild swift-corelibs-foundation swift-corelibs-xctest swiftpm lldb swift swift-corelibs-libdispatch  swift-integration-tests swift-xcode-playground-support"

for repo in $REPOS
do
  pushd $repo
    echo Attempting to rebase $repo
    git fetch apple
    git rebase apple/master
  popd
done


