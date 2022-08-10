FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI += " file://osd32mp1_brk_trusted_defconfig \
			file://README \
			"

do:configure:prepend () {
	install -m 0644 ${WORKDIR}/osd32mp1_brk_trusted_defconfig ${S}/configs
}