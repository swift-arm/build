#!/bin/bash
# Copyright 2016 iAchieved.it LLC
# MIT License (https://opensource.org/licenses/MIT)
BRANCH=swift-3.0-branch
git clone https://github.com/swift-arm/swift -b $BRANCH swift
./swift/utils/update-checkout --branch $BRANCH --clone
