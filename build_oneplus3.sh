#!/bin/bash

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

# Normalize build metadata
export KBUILD_BUILD_USER=android
export KBUILD_BUILD_HOST=localhost

# start build
brunch oneplus3

