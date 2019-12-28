#!/bin/bash

clear_set() {
  cd $1
  echo "Clearing: $PWD"
  git add . > /dev/null
  git stash > /dev/null
  find -name *.orig | while read LINE; do rm $LINE; done
  find -name *.rej | while read LINE; do rm $LINE; done
  git clean -f > /dev/null
  git stash clear > /dev/null
  cd $TOPDIR
}

THISDIR=$PWD

cd ..
TOPDIR=$PWD


clear_set external/svox
clear_set frameworks/av
clear_set frameworks/opt/telephony
clear_set lineage-sdk
clear_set system/libvintf
clear_set system/netd
clear_set system/vold

cd $THISDIR







