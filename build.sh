#!/bin/bash

machine=$1

TOPDIR=`pwd`
DOWNLOAD=$TOPDIR/../balena-build/downloads
CACHE=$TOPDIR/../balena-build/sstate-cache

./balena-yocto-scripts/build/barys -m $machine -d --shared-downloads $DOWNLOAD --shared-sstate $CACHE -l
