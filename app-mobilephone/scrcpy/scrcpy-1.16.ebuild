# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson ninja-utils git-r3

DESCRIPTION="This application provides display and control of Android devices connected on USB"
HOMEPAGE="https://github.com/Genymobile/scrcpy"

SERVER="scrcpy-server-v1.16"

EGIT_REPO_URI="https://github.com/Genymobile/scrcpy.git"
SRC_URI="https://github.com/Genymobile/scrcpy/releases/download/v1.16/${SERVER}"

LICENSE="Apache-2.0"
SLOT="0"
DEPEND="media-libs/libsdl2[opengl] media-video/ffmpeg"
RDEPEND="dev-util/android-tools"

KEYWORDS="amd64 x86"

src_configure() {
	local emesonargs=(
		-Db_lto=true
		-Dprebuilt_server="${DISTDIR}/${SERVER}"
	)
	meson_src_configure
}
