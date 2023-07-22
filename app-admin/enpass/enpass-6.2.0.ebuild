# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Enpass password manager"
HOMEPAGE="https://www.enpass.io"
SRC_URI="https://apt.enpass.io/stable/debian/pool/main/e/enpass/enpass_6.8.5.1173_amd64.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

inherit unpacker

DEPEND="x11-libs/libXScrnSaver
sys-process/lsof"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install() {
insinto /;
ENPASS_HOME=/opt/enpass
doins -r usr/;
doins -r opt/
fperms +x ${ENPASS_HOME}/Enpass
fperms +x ${ENPASS_HOME}/importer_enpass
dosym ${ENPASS_HOME}/Enpass /usr/bin/enpass
}

pkg_postinst() {
gtk-update-icon-cache
xdg_mimeinfo_database_update
xdg_desktop_database_update
}

pkg_postrm() {
gtk-update-icon-cache
xdg_mimeinfo_database_update
xdg_desktop_database_update
}
