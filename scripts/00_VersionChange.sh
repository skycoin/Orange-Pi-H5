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

## The absolute path of file
change_file=(
external/sys_config.fex
kernel/.config
uboot/include/configs/sun50iw2p1.h
)

## The absolute path of dirent.
change_dirent=(
kernel/arch/arm64/boot/dts
)

# Setup different version
CURRENT_VERSION=$1
OLD_VERSION=$2
BUFFER="$ROOT/external/BUFFER"
BUFFER_FILE="$BUFFER/FILE"
############# Don't edit

name=""

# Chech all source have exist!
# If not, abort exchange!
function source_check()
{
    for file in ${change_file[@]}; do
        if [ ! -f ${ROOT}/${file} ]; then
           echo "${ROOT}/${file} doesn't exist!"
           exit 0
        fi  
    done

    # Change dirent
    for dirent in ${change_dirent[@]}; do
        if [ ! -d ${ROOT}/${dirent} ]; then
            echo "${ROOT}/${dirent} doesn't exist!" 
            exit 0
        fi
    done
}

# Check argument from another scripts
function argument_check()
{
    if [ -z $CURRENT_VERSION -o -z $OLD_VERSION ]; then
        echo "Pls offer valid version!"
        exit 0
    fi
    if [ -z $ROOT ]; then
        echo "Pls offer valid root path!"
        exit
    fi

    if [ ! -d $BUFFER_FILE ]; then
        mkdir -p $BUFFER_FILE
    fi
}

# Exchange file and dirent
function change_version()
{
    # Change file
    for file in ${change_file[@]}; do
       name=${file##*/}
       cp $ROOT/$file $BUFFER_FILE/${OLD_VERSION}_${name}
       if [ ! -f ${BUFFER_FILE}/${CURRENT_VERSION}_${name} ]; then
           cp ${BUFFER_FILE}/${OLD_VERSION}_${name} ${BUFFER_FILE}/${CURRENT_VERSION}_${name}
       fi
       cp ${BUFFER_FILE}/${CURRENT_VERSION}_${name} $ROOT/$file
    done

    # Change dirent
    for dirent in ${change_dirent[@]}; do
        name=${dirent##*/}
        if [ -d ${BUFFER}/${OLD_VERSION}_${name} ]; then
            rm -rf ${BUFFER}/${OLD_VERSION}_${name}
        fi
        
        mv $ROOT/$dirent ${BUFFER}/${OLD_VERSION}_${name}
        
        if [ ! -d ${BUFFER}/${CURRENT_VERSION}_${name} ]; then
            cp -rf ${BUFFER}/${OLD_VERSION}_${name} ${BUFFER}/${CURRENT_VERSION}_${name}
        fi
        cp -rfa ${BUFFER}/${CURRENT_VERSION}_${name} $ROOT/$dirent
    done
}

# Backup file
function BackupFile()
{
    # Backup kernel/.config
    cp $ROOT/external/BUFFER/FILE/OrangePiH5_PC2_.config $ROOT/kernel/arch/arm64/configs/OrangePiH5_PC2_defconfig   
    cp $ROOT/external/BUFFER/FILE/OrangePiH5_Prima_.config $ROOT/kernel/arch/arm64/configs/OrangePiH5_Prima_defconfig   
    cp $ROOT/external/BUFFER/FILE/OrangePiH5_Zero_Plus2_.config $ROOT/kernel/arch/arm64/configs/OrangePiH5_Zero_Plus2_defconfig
    
    # Backup uboot/../config
    cp $ROOT/external/BUFFER/FILE/OrangePiH5_PC2_sun50iw2p1.h $ROOT/uboot/include/configs/OrangePiH5_PC2_sun50iw2p1.h
    cp $ROOT/external/BUFFER/FILE/OrangePiH5_Prima_sun50iw2p1.h $ROOT/uboot/include/configs/OrangePiH5_Prima_sun50iw2p1.h
    cp $ROOT/external/BUFFER/FILE/OrangePiH5_Zero_Plus2_sun50iw2p1.h $ROOT/uboot/include/configs/OrangePiH5_Zero_Plus2_sun50iw2p1.h

    # Backup sys_config.fex
    cp $ROOT/external/BUFFER/FILE/OrangePiH5_PC2_sys_config.fex $ROOT/external/sys_config/OrangePiH5_PC2_sys_config.fex
    cp $ROOT/external/BUFFER/FILE/OrangePiH5_Prima_sys_config.fex $ROOT/external/sys_config/OrangePiH5_Prima_sys_config.fex
    cp $ROOT/external/BUFFER/FILE/OrangePiH5_Zero_Plus2_sys_config.fex $ROOT/external/sys_config/OrangePiH5_Zero_Plus2_sys_config.fex
}

# To-do 
source_check
argument_check
change_version
BackupFile
