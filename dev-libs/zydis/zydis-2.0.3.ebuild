# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Fast and lightweight x86/x86-64 disassembler library"
HOMEPAGE="https://zydis.re"

SRC_URI="https://github.com/zyantific/zydis/archive/v${PV/_rc/-rc}.tar.gz -> ${P/-rc/_rc}.tar.gz"
KEYWORDS="~amd64 ~x86"

LICENSE="MIT"
SLOT="0"

DEPEND="dev-util/cmake"

S=${WORKDIR}/${P/_rc/-rc}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
}

