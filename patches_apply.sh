#!/bin/bash

THISDIR=$PWD

cd ..
TOPDIR=$PWD

cd build/make
echo "Patching $PWD (user/host metadata)"
patch -p1 < $THISDIR/patch_001_build.patch
cd $TOPDIR

cd device/sony/common-caf
echo "Patching $PWD (Fix Magisk 19+ recovery issue)"
patch -p1 < $THISDIR/patch_004_device-sony-common.patch
cd $TOPDIR

cd $THISDIR





