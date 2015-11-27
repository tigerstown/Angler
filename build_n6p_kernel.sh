#!/bin/bash

TOOLCHAIN=/home/tigerstown/kernelbuild/aarch64-linux-android-4.9-linaro/bin/aarch64-linux-android-
export ARCH=arm64
export SUBARCH=arm64

# make mrproper
#make CROSS_COMPILE=$TOOLCHAIN -j`grep 'processor' /proc/cpuinfo | wc -l` mrproper
 
# remove backup files
find ./ -name '*~' | xargs rm
# rm compile.log

# make kernel
make 'angler_defconfig'
make -j`grep 'processor' /proc/cpuinfo | wc -l` CROSS_COMPILE=$TOOLCHAIN #>> compile.log 2>&1 || exit -1
