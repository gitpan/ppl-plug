#!make
#
# (c) Copyright 1995, Stan Melax, ALL RIGHTS RESERVED.
# Copyright (C) 1998 Frank Holtry.  All Rights Reserved.
# (see the accompanying COPYRIGHT files for details of the copyright
#  terms and conditions).
#
# This program is free software; you can redistribute it and/or modify it
# under the same terms as Perl itself.
#
# Perl plugin for Netscape.
#
# Platforms:  Various flavors of Unix; type "make" to see a list.
#
# The output of the make process will be perlplusplugin.so.
# Install this file either in
#	/usr/local/lib/netscape/plugins/
#
#	(or)
#
#	~/.netscape/plugins/ (make install does this for you)
#
#	(or)
#
#	In any convenient directory and point environment variable
#       NPX_PLUGIN_PATH to point to the directory. It is advisable
#	that the plugins (.so) are the only files in that directory.
#
# Change these defines as required.
#
# DEBUG         True IFF you want to enable debug mode (currently only
#               plugin API trace messages).
# PERL_ROOT     Pathname to Perl's root directory, often /usr or
#               /usr/local.
# PERL_EXE      Perl binary.  Probably OK if you setup PERL_ROOT properly.
# OPTIMIZER	cc's optimization value.  If the plugin doesn't work you can
#               try -g, it may help.
# MY_CFLAGS	Additional compiler options for your environment. Should at
#		least include ${OPTIMIZER}
# INCLUDES      cc's #include directory.
# RM            Some makes don't define where "rm" is.
# MIME		Must be a mime type known to both the server and the browser.
#               Format is "mime-type:file extension:brief description"
# CGI_TYPE	This string becomes part of the message sent to the cgi
#		application.  It includes the Content-type recognized by the
#		cgi program and the 'Content-length:' string.  See np_perl.h
#		for the default.
# SECURE_CGI	The URL by which the authorization cgi-bin program is called.
# PERL5005	Adds the new thread-related opcodes to Level 4 for Perl5.005
#
# Frank and Steve.

DEBUG=0
PERL5005=1
PERL_ROOT=/usr/local
PERL_EXE=${PERL_ROOT}/bin/perl
OPTIMIZER=-O
MY_CFLAGS=${OPTIMIZER}
#MY_CFLAGS=-Ae ${OPTIMIZER} -v +z  #Use with HP_UX 10.20 native compiler
MIME="application/x-perlplus:.ppl:Perl"
CGI_TYPE="Content-type: application/x-secure-cgi\nContent-length:"
SECURE_CGI="http://www.lehigh.edu/cgi-bin/perlplus-secure.cgi"
INCLUDES=/usr/include
RM=/bin/rm

# You shouldn't have to change anything below this line!

VERSION="0.95"
ALLOW_ENV_CONFIG=0
CFLAGS= $(MY_CFLAGS) -DXP_UNIX -DDEBUG=${DEBUG} -DPERL_EXE_PATH=\"${PERL_EXE}\" -I./src -I$(INCLUDES) -DVERSION=\"${VERSION}\"  -DSECURE_CGI=\"${SECURE_CGI}\" -DMIME_TYPE=\"${MIME}\" -DCGI_TYPE=\"$(CGI_TYPE)\" -DALLOW_ENV_CONFIG=${ALLOW_ENV_CONFIG} -DPERL5005=${PERL5005}

OBJ=npunix.o npperlplus.o
SHAREDTARGET=perlplusplugin.so

make:
	@echo
	@echo "Make what?  You must specify your Unix flavor."
	@echo 
	@echo "  make linux|irix|solaris|freebsd"
	@echo

npunix.o:
	$(CC) -c $(CFLAGS) src/npunix.c

npperlplus.o:
	$(CC) -c $(CFLAGS) src/npperlplus.c

$(SHAREDTARGET): $(OBJ)
	$(LD) $(LDFLAGS) -o $(SHAREDTARGET) $(OBJ)
	@if [ '$(STRIP)' != '' ]; then \
		${STRIP} $(SHAREDTARGET); \
	fi

clean:
	$(RM) $(OBJ) $(SHAREDTARGET) core so_locations

install: $(SHAREDTARGET)
	-mkdir $(HOME)/.netscape/plugins
	-rm $(HOME)/.netscape/plugins/$(SHAREDTARGET)
	cp $(SHAREDTARGET) $(HOME)/.netscape/plugins

linux:
	@echo Making PerlPlus Plugin version ${VERSION} for Linux
	@make $(SHAREDTARGET) CC=gcc LD=gcc LDFLAGS="-shared -Wl,-soname,$(SHAREDTARGET)" STRIP=/usr/bin/strip

irix:
	@echo Making PerlPlus Plugin version ${VERSION} for IRIX
	@make $(SHAREDTARGET) CC=cc  LD=cc LDFLAGS="-shared -lc" STRIP=

solaris:
	@echo Making PerlPlus Plugin version ${VERSION} for Solaris
	@make $(SHAREDTARGET) CC=gcc LD=gcc LDFLAGS="-shared -lc" STRIP=/usr/ccs/bin/strip

#
# Freebsd contributed by Slaven Rezic
#
freebsd:
	@echo Making PerlPlus Plugin version ${VERSION} for FreeBSD
	@make $(SHAREDTARGET) CC=gcc LD=gcc LDFLAGS="-shared -lc" STRIP=/usr/bin/strip

#
# HP-UX native compiler contributed by Andrew Allen
#
hp-ux:
	@echo Making PerlPlus Plugin version ${VERSION} for HP-UX
	@make $(SHAREDTARGET) CC=cc LD=ld LDFLAGS="-b -lc" STRIP=/usr/ccs/bin/strip

