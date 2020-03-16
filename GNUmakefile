optional-pkgs := all-pkgs native-texlive-build shared largefile		\
	synctex mf mflua mfluajit mp pmp upmp tex ptex eptex uptex      \
	euptex aleph xetex pdftex luatex luajittex

enabled-pkgs := $(filter $(ENABLE),$(optional-pkgs)) web2c
disabled-pkgs := $(filter-out $(ENABLE),$(optional-pkgs))

system-pkgs := \
	mpfr gmp harfbuzz cairo libpng ptexenc kpathsea xpdf freetype2 \
	gd teckit t1lib icu graphite2 zziplib poppler

without := x mf-x-toolkit

configure-opts := \
	$(if $(PREFIX),--prefix="$(PREFIX)") \
	$(addprefix --disable-,$(disabled-pkgs)) \
	$(addprefix --enable-,$(enabled-pkgs)) \
	$(addprefix --with-system-,$(system-pkgs)) \
	$(addprefix --without-,$(without))

git-dir = $(shell cd source && git rev-parse --git-dir )

all: clean configure build

configure:
	( mkdir -p build && cd build && ../source/configure $(configure-opts) )

reautoconf:
	( cd source && ./reautoconf )

sparse-checkout:
	cp sparse-checkout.list $(git-dir)/info/sparse-checkout
	( cd source && git sparse-checkout init )

build:
	$(MAKE) -C build

clean:
	rm -fr build

.PHONY: configure reautoconf sparse-checkout build all clean

