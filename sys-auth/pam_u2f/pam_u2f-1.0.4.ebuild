# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils pam autotools-utils

DESCRIPTION="Library for authenticating against PAM with a Yubikey"
HOMEPAGE="https://github.com/Yubico/pam-u2f"
SRC_URI="https://developers.yubico.com/${PN/_/-}/Releases/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="pam-debug"

RDEPEND="
	app-crypt/libu2f-host
	app-crypt/libu2f-server
	virtual/pam"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS ChangeLog NEWS README )

src_prepare() {
	autotools-utils_src_prepare
	epatch "${FILESDIR}/${PN}-1.0.2-fix-Makefile.patch"
	use pam-debug || epatch "${FILESDIR}/${PN}-1.0.2-disable-pam-debug.patch"
}

src_configure() {
	local myeconfargs=(
		--with-pam-dir=$(getpam_mod_dir)
	)

	autotools-utils_src_configure
}
