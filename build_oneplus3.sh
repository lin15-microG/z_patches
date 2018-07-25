#!/bin/bash

# Check parameters
case "$1" in
  test) TESTKEY=true
    ;;
  sign) TESTKEY=false
    ;;
  *) echo "usage: build_oneplus3 test|sign"
     echo "-------------------------------"
     echo "test - build with testkeys (insecure, but compatible)"
     echo "sign - create a signed build"
     exit
    ;;   
esac

# Initiate environment
source build/envsetup.sh

# CCache
# ------
# uncomment the below line to set own cache 
# directory (default is ~/.ccache)
export USE_CCACHE=1
#export CCACHE_DIR=~/android/.ccache
prebuilts/misc/linux-x86/ccache/ccache -M 48G

# un-comment below line, if you want to build with root baked in
# export WITH_SU=true

# microG build
export RELEASE_TYPE=UNOFFICIAL-microG

# Normalize build metadata
export KBUILD_BUILD_USER=android
export KBUILD_BUILD_HOST=localhost

# start build
if [ "$TESTKEY" = true ] ; then
    brunch oneplus3
else
    # Variables
    ROMDATE=`date +%Y%m%d`
    ROMNAME="lineage-15.1-$ROMDATE-$RELEASE_TYPE-oneplus3-signed.zip"
    # Dist target
    rm -rf $OUT_DIR_COMMON_BASE/lin-15.1/dist
    breakfast oneplus3
    mka target-files-package dist
    # Sign the apks
    croot
    ./build/tools/releasetools/sign_target_files_apks -o -d ~/.android-certs \
        out/dist/*-target_files-*.zip \
        out/dist/op3-signed-target_files.zip
    # Create & sign OTA ZIP
    ./build/tools/releasetools/ota_from_target_files -k ~/.android-certs/releasekey \
        --block --backup=true \
        out/dist/op3-signed-target_files.zip \
        out/dist/op3-signed-ota_update.zip
    # Sign OTA ZIP
#    ./build/tools/releasetools/sign_zip.py -k ~/.android-certs/releasekey \
#        out/dist/op3-signed-ota_update.zip \
#        out/dist/op3-signed-ota_update-zipsgn.zip
    # 'Bacon' target
    ln -f out/dist/op3-signed-ota_update.zip out/target/product/oneplus3/$ROMNAME
    md5sum out/target/product/oneplus3/$ROMNAME | sed "s|out/target/product/oneplus3/||" > out/target/product/oneplus3/$ROMNAME.md5sum
fi

