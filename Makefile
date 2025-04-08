CONFIGURE		:= ./configure

CONFIGURE_ARGS		:= --disable-pcre2-8 --enable-pcre2-32 --enable-newline-is-any --enable-pcre2grep-libz --enable-pcre2grep-libbz2 --enable-year2038

GIT			:= git
MAKE			:= make

PCRE2_SOURCE		:= Sources/pcre2

SWIFT			:= swift
SWIFT_BUILD_ARGS	:= -v


configure:
	$(shell pushd $(PCRE2_SOURCE) && $(CONFIGURE) $(CONFIGURE_ARGS))

build:
	$(SWIFT) build $(SWIFT_BUILD_ARGS)

test:
	$(SWIFT) test

show-%-commands:
	$(MAKE) -C Sources/pcre2 $< -n | grep 'CC' | sort

update:
	$(GIT) subtree --help

.PHONY: clean
clean:
	$(SWIFT) package clean
