INSTALL = install
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DIR = $(INSTALL) -d
INSTALL_DATA = $(INSTALL) -m 644

all:

install:
	$(INSTALL_DIR)				$(DESTDIR)/etc/ngcp-vmnotify
	$(INSTALL_DATA)		mwi.sip		$(DESTDIR)/etc/ngcp-vmnotify/
	$(INSTALL_DATA)		vmnotify.conf	$(DESTDIR)/etc/ngcp-vmnotify/
	$(INSTALL_DIR)				$(DESTDIR)/usr/bin
	$(INSTALL_PROGRAM)	vmnotify	$(DESTDIR)/usr/bin/ngcp-vmnotify
	$(INSTALL_PROGRAM)	vmsmsnotify	$(DESTDIR)/usr/bin/ngcp-vmsmsnotify
	$(INSTALL_PROGRAM)	recnotify	$(DESTDIR)/usr/bin/ngcp-recnotify
