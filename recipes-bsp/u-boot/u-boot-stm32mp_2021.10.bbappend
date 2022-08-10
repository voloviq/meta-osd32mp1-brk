FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

LICENSE = "GPLv2+"
LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"

SRC_URI += " file://osd32mp1_brk_trusted_defconfig \
			file://README \
			"

do:configure:prepend () {
	install -m 0644 ${WORKDIR}/osd32mp1_brk_trusted_defconfig ${S}/configs
}