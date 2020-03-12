optional-pkgs := all-pkgs native-texlive-build shared largefile		\
	synctex mflua mfluajit pmp upmp ptex eptex uptex euptex aleph	\
	xetex pdftex luatex luajittex

enabled-pkgs := $(filter $(ENABLE),$(optional-pkgs)) web2c
disabled-pkgs := $(filter-out $(ENABLE),$(optional-pkgs))

system-pkgs := \
	mpfr gmp harfbuzz cairo libpng ptexenc kpathsea xpdf freetype2 \
	gd teckit t1lib icu graphite2 zziplib poppler

without := x mf-x-toolkit

configure-opts := \
	--prefix=$(or $(PREFIX),/opt/texlive) \
	$(addprefix --disable-,$(disabled-pkgs)) \
	$(addprefix --enable-,$(enabled-pkgs)) \
	$(addprefix --with-system-,$(system-pkgs)) \
	$(addprefix --without-,$(without))

all: build

build:
	rm -fr build
	mkdir build
	( cd build && ../source/configure $(configure-opts) )
	$(MAKE) -C build

clean:
	rm -fr build

.PHONY: build all

