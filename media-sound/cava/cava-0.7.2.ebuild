# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils autotools

DESCRIPTION="Console-based Audio Visualizer for ALSA, Pulseaudio"
HOMEPAGE="https://github.com/karlstav/cava"

SRC_URI="https://github.com/karlstav/cava/archive/0.7.2.tar.gz -> ${P}.tar.gz"


DEPEND="sys-devel/automake sci-libs/fftw sys-devel/libtool dev-libs/iniparser sys-libs/ncurses"
RDEPEND="pulseaudio? ( media-sound/pulseaudio )
	 alsa? ( media-libs/alsa-lib )"

IUSE="pulseaudio alsa"
SLOT="0"
KEYWORDS="amd64 x86"

INSTALL_DIR="/usr/bin/"

src_prepare() {
	default
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr install
}
