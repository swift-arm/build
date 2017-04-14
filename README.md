# build-swift
A set of helper scripts for building and packaging Swift for ARM Systems

Before executing any scripts will you want to have all of the build prerequisites installed:

```
sudo apt-get install git cmake ninja-build clang python uuid-dev libicu-dev icu-devtools libbsd-dev libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev libncurses5-dev pkg-config libblocksruntime-dev libcurl4-openssl-dev autoconf libtool systemtap-sdt-dev
```

*Note:*  For those building on Ubuntu 14.04, you will need to upgrade your `cmake` to 3.4.3 by hand.  See our companion post here: http://dev.iachieved.it/iachievedit/upgrading-cmake-for-a-happier-swift-build/.

Usage:

```
./scripts/get.sh to initially populate the directory with the Swift repositories from Github
./scripts/package.sh to build and package everything
./scripts/update.sh to refresh your source code with the latest from Github
./scripts/clean.sh to delete the build and install directory
./scripts/distclean.sh to delete everything except the helper scripts
```
