VERSION = $(shell grep Version: deb/DEBIAN/control | cut -d' ' -f2)

all: fw-mrhat.production.hex
	mkdir -p deb/opt/effective-range/fw/
	mkdir -p build
	cp fw-mrhat.production.hex deb/opt/effective-range/fw/fw-mrhat-$(VERSION)-production.hex
	dpkg-deb --root-owner-group --build deb build/mrhat-fw_$(VERSION)-1_all.deb

clean:
	rm -rf deb/opt/effective-range/fw/mrhat/
	rm -rf build

.PHONY: all clean