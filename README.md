# build-swift
A set of helper scripts for building and packaging Swift for ARM Systems

Before executing any scripts will you want to have all of the build prerequisites installed:

```
sudo apt-get install git cmake ninja-build clang uuid-dev libicu-dev icu-devtools libbsd-dev libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev libncurses5-dev pkg-config
```

*Note:*  For those building on Ubuntu 14.04, you will need to upgrade your `cmake` to 3.4.3 by hand.  See our companion post here: http://dev.iachieved.it/iachievedit/upgrading-cmake-for-a-happier-swift-build/.

Usage:

```
./get.sh to initially populate the directory with the Swift repositories from Github
./package.sh to build and package everything
./update.sh to refresh your source code with the latest from Github
./clean.sh to delete the build and install directory
./distclean.sh to delete everything except the helper scripts
```
