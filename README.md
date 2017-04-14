# build-swift
A set of helper scripts for building and packaging Swift for ARM Systems

## Prerequisites
Before executing any scripts will you want to have all of the build prerequisites installed:

```
sudo apt-get install git cmake ninja-build clang python uuid-dev libicu-dev icu-devtools libbsd-dev libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev libncurses5-dev pkg-config libblocksruntime-dev libcurl4-openssl-dev autoconf libtool systemtap-sdt-dev
```

*Note:*  For those building on Ubuntu 14.04, you will need to upgrade your `cmake` to 3.4.3 by hand.  See our companion post here: http://dev.iachieved.it/iachievedit/upgrading-cmake-for-a-happier-swift-build/.

## Usage

`scripts/update.sh`: Get or refresh the source code from the latest from GitHub
`scripts/package.sh` : Build and package everything
`scripts/clean.sh`: Delete the build and install directory
`scripts/distclean.sh `: Delete everything except the helper scripts

`update.sh` can be configured using the following environment variables:
`$SWIFT_SOURCE`: If set, this repository owner will be used for the initial checkout of the swift repository. By default it will use the ones from `swift-arm`.
`$SWIFT_VERSION`: If set, this will be the branch the script tries to checkout for all sources. Defaults to `swift-3.1-branch` on the `swift-3.1` branch in this repo.

## Examples

`export SWIFT_SOURCE="apple"; export SWIFT_VERSION="swift-3.1-branch"; update.sh`
This will checkout the original swift sources from Apple's repository using the `swift-3.1-branch` branch.


