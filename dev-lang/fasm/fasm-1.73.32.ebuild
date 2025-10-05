# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Flat Assembler"
HOMEPAGE="http://flatassembler.net/"
SRC_URI="http://flatassembler.net/fasm-${PV}.tgz"

S="${WORKDIR}/fasm"

LICENSE="fasm"
SLOT="0"
KEYWORDS="~x86 ~amd64"


src_install() {
	insinto opt/fasm
	doins -r *
	dobin fasm.x64 fasm
}
