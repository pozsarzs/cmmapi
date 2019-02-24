# +----------------------------------------------------------------------------+
# | CMMAPI 0.1 * Shell script programming API for MMxD device                  |
# | MMAPI 0.1 * Application programming interface for MMxD device              |
# | Copyright (C) 2019 Pozsár Zsolt <pozsar.zsolt@.szerafingomba.hu>           |
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
	  if [ -e $(name)_$$x.3.gz ]; \
	  then \
	    $(install) -d $(mandir)/$$x/man3; \
	    $(install) -m $(txtmode) $(name)_$$x.3.gz $(mandir)/$$x/man3; \
	    mv $(mandir)/$$x/man3/$(name)_$$x.3.gz $(mandir)/$$x/man3/$(name).3.gz ; \
	  fi; \
	done
	@$(install) -d $(mandir)/man3;
	@mv $(mandir)/en/man3/* $(mandir)/man3
	@rmdir $(mandir)/en/man3/
	@rmdir $(mandir)/en
	@echo "done."

uninstall:
	@echo -n "- Removing manual files..."
	@$(rm) $(mandir)/man3/$(name).3.gz
	@for x in $(languages); do \
	  if [ -e $(name)_$$x.3.gz ]; \
	  then \
	    $(rm) $(mandir)/$$x/man3/$(name).3.gz; \
	  fi; \
	done
	@echo "done."

