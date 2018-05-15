#!/bin/bash
set -e
##############################################
##
## Compile Mali450
##
##############################################
if [ -z $ROOT ]; then
	ROOT=`cd .. && pwd`
fi

# Knernel Direct
LINUX=$ROOT/kernel
# Compile Toolchain
TOOLS=$ROOT/toolchain/gcc-linaro-aarch/bin/aarch64-linux-gnu-
# OUTPUT DIRECT
BUILD=$ROOT/output
CORES=$((`cat /proc/cpuinfo | grep processor | wc -l` - 1))

UMP=${LINUX}/modules/gpu/mali450/kernel_mode/driver/src/devicedrv/ump

if [ ! -d $BUILD ]; then
	mkdir -p $BUILD
fi 

echo -e "\e[1;31m Compile Mali450 Module \e[0m"
if [ ! -d $BUILD/lib ]; then
	mkdir -p $BUILD/lib
fi 

# Compile Mali450 driver
make -C ${LINUX}/modules/gpu ARCH=arm64 CROSS_COMPILE=$TOOLS LICHEE_KDIR=${LINUX} \
	LICHEE_MOD_DIR=$BUILD/lib LICHEE_PLATFORM=linux

# Install mali driver
MALI_MOD_DIR=$BUILD/lib/modules/`cat $LINUX/include/config/kernel.release 2> /dev/null`/kernel/drivers/gpu
install -d $MALI_MOD_DIR
mv ${BUILD}/lib/mali.ko $MALI_MOD_DIR








