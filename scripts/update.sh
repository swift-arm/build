#!/bin/bash
# Copyright 2016 iAchieved.it LLC
# MIT License (https://opensource.org/licenses/MIT)

pushd "$(dirname $0)/../" > /dev/null

BRANCH=${SWIFT_VERSION:-swift-3.1-branch}

if [ -d "./swift" ]; then
    ./swift/utils/update-checkout --scheme $BRANCH
else
    git clone https://github.com/swift-arm/swift -b $BRANCH swift && \
        ./swift/utils/update-checkout --clone --scheme $BRANCH
fi

popd > /dev/null
