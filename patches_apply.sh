#!/bin/bash

THISDIR=$PWD

cd ..
TOPDIR=$PWD

cd build/make
echo "Patching $PWD (user/host metadata)"
patch -p1 < $THISDIR/patch_001_build.patch
cd $TOPDIR

cd device/oneplus/oneplus3
echo "Patching $PWD (Randomize MAC)"
patch -p1 < $THISDIR/patch_002_device_oneplus3.patch
cd $TOPDIR

cd $THISDIR





