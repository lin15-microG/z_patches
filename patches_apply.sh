#!/bin/bash

THISDIR=$PWD

cd ..
TOPDIR=$PWD

cd build/make
echo "Patching $PWD (user/host metadata)"
patch -p1 < $THISDIR/patch_001_build.patch
cd $TOPDIR

cd vendor/lineage
echo "Patching $PWD (build with own signing keys)"
patch -p1 < $THISDIR/patch_002_vendor_lineage.patch
cd $TOPDIR

cd bootable/recovery-twrp
echo "Patching $PWD (work-around for 'struct epoll_event' build error)"
patch -p1 < $THISDIR/patch_003_bootable_recovery-twrp.patch
cd $TOPDIR

cd $THISDIR





