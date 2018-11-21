#!/bin/bash

THISDIR=$PWD

cd ..
TOPDIR=$PWD

cd build/make
echo "Patching $PWD (user/host metadata)"
patch -p1 < $THISDIR/patch_001_build.patch
cd $TOPDIR

cd system/bt
echo "Patching $PWD (CVE-2018-9544, CVE-2018-9545)"
patch -p1 < $THISDIR/patch_002_system_bt.patch
cd $TOPDIR


cd $THISDIR





