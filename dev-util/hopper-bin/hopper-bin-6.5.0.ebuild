# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg

DESCRIPTION="Interactive disassembler, decompiler and debugger (official binary demo)"
HOMEPAGE="https://www.hopperapp.com/"
SRC_URI="https://www.hopperapp.com/downloader/public/Hopper-${PV}-Linux-demo.pkg.tar.xz"
S="${WORKDIR}"

# Proprietary EULA: https://www.hopperapp.com/license_agreement.html
LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="bindist mirror strip"

RDEPEND="
	>=dev-libs/gmp-6.3:0=
	dev-libs/libbsd
	>=dev-qt/qtbase-6.10:6[gui,network,opengl,widgets,xml]
	>=sys-devel/gcc-16.1.1:=[cxx]
	>=sys-libs/glibc-2.40
	virtual/zlib:0/1
	>=media-libs/libglvnd-1.7.0
	>=x11-libs/libX11-1.8.13
	>=x11-libs/libXrender-0.9.12
"

QA_PREBUILT="opt/hopper/*"

src_install() {
	# Preserve executable modes and bundled library symlinks.
	insinto /opt
	doins -r opt/hopper
	fperms +x /opt/hopper/bin/Hopper /opt/hopper/bin/hopper_mcp
	dosym ../../opt/hopper/bin/Hopper /usr/bin/hopper
	dosym ../../opt/hopper/bin/hopper_mcp /usr/bin/hopper_mcp

	domenu usr/share/applications/*.desktop
	insinto /usr/share/icons
	doins -r usr/share/icons/hicolor
	insinto /usr/share/mime/packages
	doins usr/share/mime/packages/com.hopperapp.Hopper.xml

	# Hopper uses this fixed path for its built-in help.
	docinto html
	dodoc -r usr/share/doc/hopper/.
	dosym ${PF}/html /usr/share/doc/hopper
}
