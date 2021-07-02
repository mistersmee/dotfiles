# Maintainer: Aseem Athale <athaleaseem@gmail.com>

pkgname=dwm-aseem
_pkgname=dwm
pkgver=6.2.r1709.e586219
pkgrel=1
epoch=1
pkgdesc="My build of dwm."
url='https://github.com/mistersmee/dwm'
arch=(any)
license=('MIT')
depends=('git')
makedepends=('make')
source=('git://github.com/mistersmee/dwm')
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
}
