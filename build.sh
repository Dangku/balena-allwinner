#!/bin/bash

usage() {
	cat <<-EOT >&2
	Usage: $0 <machine>
	EOT
}

if [ $# -eq 0 ]; then
        usage
        exit 1
fi

machine=$1

TOPDIR=`pwd`
DOWNLOAD=$TOPDIR/../balena-build/downloads
CACHE=$TOPDIR/../balena-build/${machine}-sstate-cache

if [ ! -d $CACHE ]; then
	mkdir $CACHE
fi

./balena-yocto-scripts/build/barys -m $machine -b build-$machine -d --shared-downloads $DOWNLOAD --shared-sstate $CACHE -l -r
