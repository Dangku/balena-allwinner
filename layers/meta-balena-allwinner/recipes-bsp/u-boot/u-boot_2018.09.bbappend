UBOOT_KCONFIG_SUPPORT = "1"
inherit resin-u-boot
FILESEXTRAPATHS_append := ":${THISDIR}/files:${THISDIR}/u-boot_2018.09:"

# remove the resin-specific-env-integration-kconfig.patch patch from
# meta-sunxi because it fails to apply
SRC_URI_remove = "file://resin-specific-env-integration-kconfig.patch"

# Add re-worked patch resin-specific-env-integration-kconfig_reworked.patch
SRC_URI_append = " \
		file://resin-specific-env-integration-kconfig_reworked.patch \
		file://boot.cmd.in \
		"
do_compile_prepend() {
    sed -e 's/@@KERNEL_IMAGETYPE@@/${KERNEL_IMAGETYPE}/' \
        -e 's/@@KERNEL_BOOTCMD@@/${KERNEL_BOOTCMD}/' \
        "${WORKDIR}/boot.cmd.in" > "${WORKDIR}/boot.cmd"
}
