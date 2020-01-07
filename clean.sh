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

source layers/poky/oe-init-build-env build-$machine

MACHINE=$machine bitbake -c clean linux-mainline
MACHINE=$machine bitbake -c clean u-boot
MACHINE=$machine bitbake -c clean atf-sunxi
MACHINE=$machine bitbake -c clean resin-image
MACHINE=$machine bitbake -c clean resin-image-flasher
MACHINE=$machine bitbake -c clean resin-image-initramfs

MACHINE=$machine bitbake -c cleansstate linux-mainline
MACHINE=$machine bitbake -c cleansstate u-boot
MACHINE=$machine bitbake -c cleansstate atf-sunxi
MACHINE=$machine bitbake -c cleansstate resin-image
MACHINE=$machine bitbake -c cleansstate resin-image-flasher
MACHINE=$machine bitbake -c cleansstate resin-image-initramfs
