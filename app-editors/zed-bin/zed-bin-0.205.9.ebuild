# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The fast, collaborative code editor"
HOMEPAGE="https://zed.dev"
SRC_URI="http://zed.dev/api/releases/stable/${PV}/zed-linux-x86_64.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/zed.app"

src_install() {
	insinto opt/zed
	doins -r *
	newbin bin/zed zed-bin
}
