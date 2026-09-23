BASH_SCRIPTS = \
	recnotify \
	# EOL

PERL_SCRIPTS = \
	vmemailnotify \
	vmnotify \
	vmsmsnotify \
	# EOL

INSTALL = install
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DIR = $(INSTALL) -d
INSTALL_DATA = $(INSTALL) -m 644

all:

check: shellcheck perlcheck

shellcheck:
	@echo "Checking for shell syntax errors: "; \
	RC=0; \
	for SCRIPT in $(BASH_SCRIPTS); do \
	  echo -n "  $${SCRIPT}: "; \
	  if ! [ -r "$${SCRIPT}" ]; then \
	    echo "FAIL (missing)"; RC=1; \
	  elif ! bash -n $${SCRIPT}; then \
	    echo "FAIL (syntax)"; RC=1; \
	  else \
	    echo "PASS"; \
	  fi; \
	done; \
	echo "done."; \
	exit $${RC}

perlcheck:
	@echo "Checking for perl syntax errors: "; \
	RC=0; \
	for SCRIPT in $(PERL_SCRIPTS); do \
	  echo -n "  $${SCRIPT}: "; \
	  if ! [ -r "$${SCRIPT}" ]; then \
	    echo "FAIL (missing)"; RC=1; \
	  elif ! perl -Ilib -CSD -w -c $${SCRIPT}; then \
	    echo "FAIL (syntax)"; RC=1; \
	  fi; \
	done; \
	echo "done."; \
	exit $${RC}

install:
	$(INSTALL_DIR)				$(DESTDIR)/etc/ngcp-vmnotify
	$(INSTALL_DATA)		mwi.sip		$(DESTDIR)/etc/ngcp-vmnotify/
	$(INSTALL_DATA)		vmnotify.conf	$(DESTDIR)/etc/ngcp-vmnotify/
	$(INSTALL_DIR)				$(DESTDIR)/usr/bin
	$(INSTALL_PROGRAM)	vmnotify	$(DESTDIR)/usr/bin/ngcp-vmnotify
	$(INSTALL_PROGRAM)	vmsmsnotify	$(DESTDIR)/usr/bin/ngcp-vmsmsnotify
	$(INSTALL_PROGRAM)	recnotify	$(DESTDIR)/usr/bin/ngcp-recnotify
	$(INSTALL_PROGRAM)	vmemailnotify	$(DESTDIR)/usr/bin/ngcp-vmemailnotify
