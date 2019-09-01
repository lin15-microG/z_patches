#!/bin/bash

THISDIR=$PWD

cd ..
TOPDIR=$PWD

cd build/make
echo "Patching $PWD (user/host metadata)"
patch -p1 < $THISDIR/patch_001_build.patch
cd $TOPDIR

cd external/svox
echo "-"
echo "Patching $PWD (SVOX fix)"
patch -p1 < $THISDIR/patch_002_external_svox.patch
cd $TOPDIR

cd $THISDIR





