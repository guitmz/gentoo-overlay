# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Fast and lightweight x86/x86-64 disassembler library"
HOMEPAGE="https://zydis.re"

SRC_URI="https://github.com/zyantific/zydis/archive/v${PV/_rc/-rc}.tar.gz -> ${P/-rc/_rc}.tar.gz"
KEYWORDS="~amd64 ~x86"

LICENSE="MIT"
SLOT="0"

S=${WORKDIR}/${P/_rc/-rc}

src_compile() {
	default
	cd ${S}
	mkdir build
	cd build
	cmake ..
	make
}

src_install() {
	default
	make install
}

