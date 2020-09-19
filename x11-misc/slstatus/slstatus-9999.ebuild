# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 savedconfig

DESCRIPTION="Status Monitor for windows manager to fill status bar"
HOMEPAGE="tools.suckless.org/suckless"

EGIT_REPO_URI="https://github.com/drkhsh/slstatus.git"

DEPEND=""
RDEPEND=""
SLOT="0"
LICENSE="ISC"
KEYWORDS="amd64 x86"
IUSE="+savedconfig"

src_prepare() {
	default
        restore_config config.h
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	save_config config.h
}

pkg_postinst() {
	elog "For custom configuration copy your config.h"
	elog "as /etc/portage/savedconfig/x11-misc/slstatus-9999"
}
