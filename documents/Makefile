# +----------------------------------------------------------------------------+
# | CMMAPI v0.1 * Command line utility for MMAPI library                       |
# | Copyright (C) 2019 Pozsár Zsolt <pozsar.zsolt@szerafingomba.hu>            |
# | Makefile                                                                   |
# | Makefile for documents                                                     |
# +----------------------------------------------------------------------------+

include ../Makefile.global

docfiles= `ls | grep -v Makefile | grep -v ?? | grep -v sample`
lang=

all:

clean:

install:
	@echo -n "- Installing document files..."
	@$(install) -d $(datarootdir)/doc/$(name)/$(lang)
	@for x in $(docfiles); do \
	  if [ -e $$x ]; then $(install) -m $(txtmode) $$x $(datarootdir)/doc/$(name)/$(lang); fi; \
	done
	@echo "done."

uninstall:
	@echo -n "- Removing document files..."
	@for x in $(docfiles); do \
	  if [ -e $$x ]; then $(rm) $(datarootdir)/doc/$(name)/$(lang)/$$x; fi; \
	done
	@rmdir $(datarootdir)/doc/$(name)/$(lang)
	@echo "done."

