#!/bin/bash

THISDIR=$PWD

cd ..
TOPDIR=$PWD

cd external/svox
echo "-"
echo "Patching $PWD (SVOX fix)"
patch -p1 < $THISDIR/patch_002_external_svox.patch
cd $TOPDIR

cd $THISDIR





