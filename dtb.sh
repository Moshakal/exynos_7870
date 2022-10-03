#!/bin/bash

DTS=arch/arm64/boot/dts
RDIR=$(pwd)

export ARCH=arm64
export PLATFORM_VERSION=8.1.0
export ANDROID_MAJOR_VERSION=o
export CROSS_COMPILE=/home/mohamed/samsung-exynos9820-toolchain-samsung/gcc-cfp/gcc-cfp-jopp-only/aarch64-linux-android-4.9/bin/aarch64-linux-android-
make clean && make mrproper
make exynos7870-gtaxllte_defconfig
make dtbs

./scripts/dtbTool/dtbTool -o ./boot.img-dtb -d $DTS/ -s 2048

rm -rf $DTS/.*.tmp
rm -rf $DTS/.*.cmd
rm -rf $DTS/*.dtb


