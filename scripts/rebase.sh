#!/bin/bash

# Repos that use stable
REPOS="clang compiler-rt"

for repo in $REPOS
do
  pushd $repo
    REMOTES=`git remote -v | wc -l`
    if [ $REMOTES -lt "4" ]; then
      echo Adding Apple repos
      git remote add apple `git remote -v | head -n1 | sed 's/Swift-Arm/apple/' | sed 's/origin//' | sed 's/(fetch)//'`
    fi

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
    REMOTES=`git remote -v | wc -l`
    if [ $REMOTES -lt "4" ]; then
      echo Adding Apple repos
      git remote add apple `git remote -v | head -n1 | sed 's/Swift-Arm/apple/' | sed 's/origin//' | sed 's/(fetch)//'`
    fi

    echo Attempting to rebase $repo
    git fetch apple
    git rebase apple/master
  popd
done


