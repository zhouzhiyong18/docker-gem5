#!/bin/bash
# Build and Clean in one step to keep image manageable

ARCH=X86

scons -j$(nproc) --ignore-style build/$ARCH/gem5.opt
scons -c
rm -f /usr/local/bin/gem5.opt
cp build/$ARCH/gem5.opt /tmp/gem5.opt
rm -rf build
mkdir -p build/$ARCH
mv /tmp/gem5.opt build/$ARCH
ln -s build/$ARCH/gem5.opt /usr/local/bin/gem5.opt
