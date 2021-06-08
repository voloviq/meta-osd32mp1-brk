FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " file://osd32mp1_brk_defconfig"

KERNEL_DEFCONFIG = ""
KERNEL_EXTERNAL_DEFCONFIG = "osd32mp1_brk_defconfig"
KERNEL_CONFIG_FRAGMENTS = ""
