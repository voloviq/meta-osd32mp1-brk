FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

RDEPENDS:${PN}:remove = "${LTTNGMODULES}"
RDEPENDS:${PN}:remove = "${LTTNGTOOLS}"

RRECOMMENDS:${PN}:remove = "${@bb.utils.contains('DISTRO_FEATURES', 'gplv3', '', '${PERF}', d)}"

CORE_IMAGE_EXTRA_REMOVE += " lttng-tools lttng-modules "

RDEPENDS:${PN} = "\
    ${PROFILETOOLS} \
    ${BABELTRACE} \
    ${BABELTRACE2} \
    ${SYSTEMTAP} \
    ${VALGRIND} \
    "
