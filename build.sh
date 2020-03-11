#!/bin/bash

set -e

rm -fr build
mkdir build
cd build

../source/configure \
	--disable-all-pkgs \
	--disable-native-texlive-build \
	--disable-shared \
	--disable-largefile \
	--disable-synctex \
	--disable-mf \
	--disable-mflua \
	--disable-mfluajit \
	--disable-mp \
	--disable-pmp \
	--disable-upmp \
	--disable-tex \
	--disable-ptex \
	--disable-eptex \
	--disable-uptex \
	--disable-euptex \
	--disable-aleph \
	--disable-xetex \
	--disable-pdftex \
	--disable-luatex \
	--disable-luajittex \
	--enable-web2c \
	--with-system-mpfr \
	--with-system-gmp \
	--with-system-harfbuzz \
	--with-system-cairo \
	--with-system-libpng \
	--with-system-ptexenc \
	--with-system-kpathsea \
	--with-system-xpdf \
	--with-system-freetype2 \
	--with-system-gd \
	--with-system-teckit \
	--with-system-t1lib \
	--with-system-icu \
	--with-system-graphite2 \
	--with-system-zziplib \
	--with-system-poppler \
	--without-x \
	--without-mf-x-toolkit

make
