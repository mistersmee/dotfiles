# Maintainer: Aseem Athale <athaleaseem@gmail.com>

pkgname=dwm-aseem
_pkgname=dwm
pkgver=6.3.r1737.8909960
pkgrel=1
epoch=1
pkgdesc="My build of dwm."
url='https://github.com/mistersmee/dwm'
arch=(any)
license=('MIT')
depends=('libxinerama' 'fontconfig' 'libxft-bgra-git' 'libx11' 'libxcb' 'xcb-proto' 'libxrender')
makedepends=('git')
source=('git+https://github.com/mistersmee/dwm')
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
