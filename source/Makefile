# +----------------------------------------------------------------------------+
# | CMMAPI v0.1 * Command line utility for MMAPI library                       |
# | Copyright (C) 2019 Pozsár Zsolt <pozsar.zsolt@szerafingomba.hu>            |
# | Makefile                                                                   |
# | Make file for source code                                                  |
# +----------------------------------------------------------------------------+

include ../Makefile.global

srcfiles = cmmapi.pas
binfiles = cmmapi

all:
	@echo "- Compiling source code..."
	@mkdir -p ./lib/$(architecture)-$(os)/
	@for x in $(srcfiles); do \
	  if [ -e $$x ]; then ppc386 $(fpflag) $$x; echo ""; fi; \
	done
	@echo "done."

clean:
	@echo -n "- Cleaning source code..."
	@$(rm) ./lib/$(architecture)-$(os)/*
	@echo "done."

install:
	@echo -n "- Installing binary files..."
	@$(install) -d $(bindir)
	@for x in $(binfiles); do \
	  if [ -e ./lib/$(architecture)-$(os)/$$x ]; then $(install) -m $(binmode) ./lib/$(architecture)-$(os)/$$x $(bindir); fi; \
	done
	@echo "done."

uninstall:
	@echo -n "- Removing binary files..."
	@for x in $(binfiles); do $(rm) $(bindir)/$$x; done
	@echo "done."
