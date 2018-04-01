MIX = mix
CFLAGS = -g -O3 -ansi -Wall -Werror -Wextra -Wno-unused-parameter -Wno-missing-field-initializers

ERLANG_PATH = $(shell erl -eval 'io:format("~s", [lists:concat([code:root_dir(), "/erts-", erlang:system_info(version), "/include"])])' -s init stop -noshell)
CFLAGS += -I$(ERLANG_PATH)

ifneq ($(OS),Windows_NT)
	CFLAGS += -fPIC

	ifeq ($(shell uname),Darwin)
		LDFLAGS += -dynamiclib -undefined dynamic_lookup
	endif
endif

.PHONY: all crypto_nifs clean

all: crypto_nifs

crypto_nifs:
	$(MIX) compile

priv/crypto_nifs.so: lib/c_src/crypto_nifs.c
	$(CC) $(CFLAGS) -lsodium -shared $(LDFLAGS) -o $@ lib/c_src/crypto_nifs.c

clean:
	$(MIX) clean
	$(RM) priv/crypto_nifs.so

#	----------------------------------------------------------------------
#	Libraries have been installed in:
#	   /usr/lib
#	If you ever happen to want to link against installed libraries
#	in a given directory, LIBDIR, you must either use libtool, and
#	specify the full pathname of the library, or use the '-LLIBDIR'
#	flag during linking and do at least one of the following:
#	   - add LIBDIR to the 'LD_LIBRARY_PATH' environment variable
#		 during execution
#	   - add LIBDIR to the 'LD_RUN_PATH' environment variable
#		 during linking
#	   - use the '-Wl,-rpath -Wl,LIBDIR' linker flag
#	   - have your system administrator add LIBDIR to '/etc/ld.so.conf'
#	See any operating system documentation about shared libraries for
#	more information, such as the ld(1) and ld.so(8) manual pages.
#	----------------------------------------------------------------------
