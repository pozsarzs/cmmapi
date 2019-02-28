# +----------------------------------------------------------------------------+
# | CMMAPI 0.1 * Command line utility for MMAPI library                        |
# | Copyright (C) 2019 Pozsár Zsolt <pozsar.zsolt@szerafingomba.hu>            |
# | Makefile                                                                   |
# | Makefile for Unix-like systems                                             |
# +----------------------------------------------------------------------------+

include ../Makefile.global

languages = en hu

all:

clean:

install:
	@echo -n "- Installing manual files..."
	@for x in $(languages); do \
	  if [ -e $(name)_$$x.1.gz ]; \
	  then \
	    $(install) -d $(mandir)/$$x/man1; \
	    $(install) -m $(txtmode) $(name)_$$x.1.gz $(mandir)/$$x/man1; \
	    mv $(mandir)/$$x/man1/$(name)_$$x.1.gz $(mandir)/$$x/man1/$(name).1.gz ; \
	  fi; \
	done
	@$(install) -d $(mandir)/man1;
	@mv $(mandir)/en/man1/* $(mandir)/man1
	@rmdir $(mandir)/en/man1/
	@rmdir $(mandir)/en
	@echo "done."

uninstall:
	@echo -n "- Removing manual files..."
	@$(rm) $(mandir)/man1/$(name).1.gz
	@for x in $(languages); do \
	  if [ -e $(name)_$$x.1.gz ]; \
	  then \
	    $(rm) $(mandir)/$$x/man1/$(name).1.gz; \
	  fi; \
	done
	@echo "done."

