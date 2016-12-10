#!/bin/bash

REPOS="clang compiler-rt llvm cmark llbuild swift-corelibs-foundation swift-corelibs-xctest swiftpm lldb swift swift-corelibs-libdispatch  swift-integration-tests swift-xcode-playground-support"

for repo in $REPOS
do
  pushd $repo
    REMOTES=`git remote -v | wc -l`
    if [ $REMOTES -lt "4" ]; then
      echo Adding Apple repos
      git remote add apple `git remote -v | head -n1 | sed 's/.wift-.rm/apple/' | sed 's/origin//' | sed 's/(fetch)//'`
    fi

    echo Attempting to rebase $repo
    git checkout swift-3.0-branch
    git fetch apple
    git rebase apple/swift-3.0-branch
  popd
done

