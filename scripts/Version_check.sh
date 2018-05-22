#!/bin/bash
set -e
####################
# 
# This scripts is used to change different version.
# You need set ROOT and BUFFER path first!
# Create By: Buddy <buddy.zhang@aliyun.com>
# Date: 2017-01-05
# 
####################

# Setup different version
CURRENT_VERSION=$1
############# Don't edit

name=""

function CopyFile()
{
    if [ ! -f $ROOT/kernel/.config ]; then
        cp $ROOT/kernel/arch/arm64/configs/${CURRENT_VERSION}_defconfig $ROOT/kernel/.config
    fi 

    if [ ! -f $ROOT/uboot/include/configs/sun50iw2p1.h ]; then
        cp $ROOT/uboot/include/configs/${CURRENT_VERSION}_sun50iw2p1.h $ROOT/uboot/include/configs/sun50iw2p1.h
    fi

    if [ ! -f $ROOT/external/sys_config.fex ]; then
        cp $ROOT/external/sys_config/${CURRENT_VERSION}_sys_config.fex $ROOT/external/sys_config.fex
    fi
}

# To-do 
CopyFile
