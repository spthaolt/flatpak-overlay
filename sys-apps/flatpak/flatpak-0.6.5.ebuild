# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
GCONF_DEBUG="no"

inherit autotools gnome2

SRC_URI="https://github.com/${PN}/${PN}/releases/download/${PV}/${P}.tar.xz"
DESCRIPTION="Application distribution framework"
HOMEPAGE="http://flatpak.org/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64"
IUSE="doc introspection"

# FIXME: pin the only working libgsystem version
RDEPEND="
	=dev-libs/libgsystem-2015.1
	>=sys-fs/ostree-2016.5
	>=net-libs/libsoup-2.4
	dev-libs/glib:2
	>=sys-auth/polkit-0.98
	sys-fs/fuse
	sys-apps/dbus
	dev-libs/json-glib
	app-arch/libarchive
	>=dev-libs/elfutils-0.8.12
"
DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35
	>=dev-util/pkgconfig-0.24
	introspection? ( >=dev-libs/gobject-introspection-1.40 )
	doc? ( >=dev-util/gtk-doc-1.20
	       dev-libs/libxslt )
"

src_prepare() {

        eautoreconf
        gnome2_src_prepare

}

src_configure() {

	gnome2_src_configure \
		--with-libarchive \
		$(use_enable doc documentation) \
		$(use_enable introspection)

}
