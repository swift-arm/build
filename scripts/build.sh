./swift/utils/build-script \
  -R \
  --llbuild \
  --foundation \
  --xctest \
  --swiftpm \
  --xctest \
  --libdispatch \
  -- \
  --install-libdispatch \
  --install-swift \
  --install-llbuild \
  --install-foundation \
  --install-swiftpm \
  --install-xctest \
  --reconfigure \
  --install-prefix=/usr \
  '--swift-install-components=autolink-driver;compiler;clang-builtin-headers;stdlib;swift-remote-mirror;sdk-overlay;editor-integration' \
  --build-swift-static-stdlib \
  --build-swift-static-sdk-overlay \
  --build-swift-stdlib-unittest-extra \
  --skip-test-lldb \
  --install-destdir=$HOME/swift-install \
  --installable-package=$HOME/swift.tar.gz

mv $HOME/swift-install/usr/lib/swift/linux/armv7l/* $HOME/swift-install/usr/lib/swift/linux/armv7/
rm -rf $HOME/swift-install/usr/lib/swift/linux/armv7l
cd $HOME/swift-install
tar -czvf $HOME/swift.tar.gz *
