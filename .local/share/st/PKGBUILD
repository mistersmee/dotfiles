# Maintainer: Aseem Athale <athaleaseem@gmail.com>

pkgname=st-aseem
_pkgname=st
pkgver=0.8.4.r1161.c206ccc
pkgrel=1
epoch=1
pkgdesc="My build of st."
url='https://github.com/mistersmee/st'
arch=(any)
license=('MIT')
depends=('git')
makedepends=('make')
source=('git://github.com/mistersmee/st')
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
	install -Dm44 LICENSE "${pkgdir}/user/share/licenses/${pkgname}/LICENSE"
	install -Dm44 README.md "${pkgdir}/user/share/doc/${pkgname}/README.md"
}
