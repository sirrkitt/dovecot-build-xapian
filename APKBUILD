pkgname=dovecot-fts-xapian
pkgver=1.3.3
pkgrel=0
pkgdesc="Xapian FTS Plugin for Dovecot"
url="https://github.com/grosjo/fts-xapian"
arch="all"
license="custom"
source="$pkgname-$pkgver.tar.gz::https://github.com/grosjo/fts-xapian/archive/$pkgver.tar.gz"
options="!test"
makedepends="
        dovecot-dev
        xapian-core-dev
        autoconf
        icu-dev
        automake
        libtool
"
unpack() {
        default_unpack
        mv $srcdir/fts-xapian-$pkgver $srcdir/$pkgname-$pkgver
}
prepare() {
        default_prepare
        autoreconf -vi
}

build() {
        ./configure \
                --with-dovecot=/usr/lib/dovecot
        make DESTDIR="$pkgdir" prefix=/usr
}
package() {
        make DESTDIR="$pkgdir" prefix=/usr install
}
sha512sums="2ad40466d735dc57c297888efcd62af513fe7e674f23caaa63342f744cf7b1ecf7525bea1944386179538ca7e7fd748098f95a531b071382cdec12e1b7a5e02c  dovecot-fts-xapian-1.3.3.tar.gz"
