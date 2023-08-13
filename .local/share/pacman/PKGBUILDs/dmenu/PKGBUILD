# Maintainer: Aseem Athale <athaleaseem@gmail.com>

pkgname=dmenu-aseem
_pkgname=dmenu
pkgver=5.1.r639.97a6b33
pkgrel=1
epoch=1
pkgdesc="My build of dmenu."
url='https://github.com/mistersmee/dmenu'
arch=(any)
license=('GPL')
depends=('fontconfig' 'libxinerama' 'libxft-bgra-git')
makedepends=('git')
source=('git+https://github.com/mistersmee/dmenu')
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
	make
}

package() {
	cd "${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm44 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm44 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
