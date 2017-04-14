#!/bin/bash

pushd "$(dirname $0)/../" > /dev/null

BUILD_ROOT="$(pwd)/build"
INSTALL_DIR="$(pwd)/install"
PACKAGE="$(pwd)/swift.tar.gz"

export SWIFT_BUILD_ROOT="${BUILD_ROOT}"

fix_arm_install_package() {
    mkdir -p "${INSTALL_DIR}/usr/lib/swift"
    cp -R "./swift-corelibs-libdispatch/dispatch/" "${INSTALL_DIR}/usr/lib/swift/"

    DISPATCH_SRC="${BUILD_ROOT}/buildbot_linux/libdispatch-linux-armv7/src"
    mkdir -p "${INSTALL_DIR}/usr/lib/swift/linux/armv7"
    cp "${DISPATCH_SRC}/swift/Dispatch.swiftdoc" "${DISPATCH_SRC}/swift/Dispatch.swiftmodule" "${INSTALL_DIR}/usr/lib/swift/linux/armv7/"
    cp "${DISPATCH_SRC}/libdispatch.la" "${DISPATCH_SRC}/.libs/libdispatch.so" "${INSTALL_DIR}/usr/lib/swift/linux/"

    mkdir -p "${INSTALL_DIR}/usr/lib/swift/os"
    cp "./swift-corelibs-libdispatch/os/linux_base.h" "./swift-corelibs-libdispatch/os/object.h" "${INSTALL_DIR}/usr/lib/swift/os"
}

echo "=> Cleaning previous installation folder and installation package"
rm -rf "${INSTALL_DIR}" "${PACKAGE}"

if [[ $(arch) =~ armv7 ]]; then
    echo "=> Building for ARM"

    PRESETS_FILE="./etc/arm_buildbots.ini"
    if [ -e "${PRESETS_FILE}" ]; then
        PRESET_OPTION="--preset-file=${PRESETS_FILE}"
    fi
    ./swift/utils/build-script ${PRESET_OPTION} --preset=buildbot_linux_armv7 install_destdir="${INSTALL_DIR}" installable_package="${PACKAGE}"

    RETVAL=$?
    if [ $RETVAL -ne "0" ]; then
        echo "=> Build failed!"
        popd > /dev/null
        exit $RETVAL
    fi

    echo "=> Fixing up the install package for ARM"
    fix_arm_install_package

    echo "=> Retar installation package"
    tar -czf "${PACKAGE}" "${INSTALL_DIR}" --owner=0 --group=0
else
    LSB_RELEASE=`lsb_release -rs  | tr -d .`
    echo "=> Building for x86 with linux_${LSB_RELEASE} buildbot"
    ./swift/utils/build-script --preset=buildbot_linux_${LSB_RELEASE} install_destdir="${INSTALL_DIR}" installable_package="${PACKAGE}"
fi

popd > /dev/null
