#!/bin/bash

THISDIR=$PWD

cd ..
TOPDIR=$PWD

cd external/svox
echo "-"
echo "Patching $PWD (SVOX fix)"
patch -p1 < $THISDIR/patch_002_external_svox.patch
cd $TOPDIR

cd frameworks/av
echo "-"
echo "Patching $PWD (HUAWEI fix)"
patch -p1 < $THISDIR/patch_101_frameworks_av.patch
cd $TOPDIR

cd frameworks/opt/telephony
echo "-"
echo "Patching $PWD (HUAWEI fix)"
patch -p1 < $THISDIR/patch_102_frameworks_opt_telephony.patch
cd $TOPDIR

cd lineage-sdk
echo "-"
echo "Patching $PWD (Treble patching)"
patch -p1 < $THISDIR/patch_107_lineage-sdk.patch
cd $TOPDIR

cd system/libvintf
echo "-"
echo "Patching $PWD (Treble patching)"
patch -p1 < $THISDIR/patch_103_system_libvintf.patch
patch -p1 < $THISDIR/patch_104_system_libvintf.patch
cd $TOPDIR

cd system/netd
echo "-"
echo "Patching $PWD (HUAWEI fix)"
patch -p1 < $THISDIR/patch_105_system_netd.patch
cd $TOPDIR

cd system/vold
echo "-"
echo "Patching $PWD (Treble patching)"
patch -p1 < $THISDIR/patch_106_system_vold.patch
cd $TOPDIR


cd $THISDIR





