# Maintainer: Aseem Athale <athaleaseem@gmail.com>

pkgname=st-aseem
_pkgname=st
pkgver=0.8.5.r1200.90dca02
pkgrel=1
epoch=1
pkgdesc="My build of st."
url='https://github.com/mistersmee/st'
arch=(any)
license=('MIT')
depends=('fontconfig' 'harfbuzz' 'libxrender' 'libxft-bgra-git' 'libxext' 'ncurses')
makedepends=('git')
source=('git+https://github.com/mistersmee/st')
sha1sums=('SKIP')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${_pkgname}"
	printf "%s.r%s.%s" "$(awk '/^VERSION =/ {print $3}' config.mk)" \
		"$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $srcdir/${_pkgname}
}

build() {
	cd "${_pkgname}"
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm44 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm44 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
