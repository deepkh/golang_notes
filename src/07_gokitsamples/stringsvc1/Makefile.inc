# Copyright (c) 2018, Gary Huang, deepkh@gmail.com, https://github.com/deepkh
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

SHELL=/bin/sh

### tcp_proxy #####################################################################################
STRINGSVC1: ${STRINGSVC1_BIN}
	@echo MAKE STRINGSVC1 

STRINGSVC1_CLEAN: ${STRINGSVC1_BIN_CLEAN}
	@echo MAKE STRINGSVC1_CLEAN 

${STRINGSVC1_BIN}:
	$(CD) ${STRINGSVC1} && $(MAKE) -f Makefile.${STRINGSVC1_NAME} -j8 $@

STRINGSVC1_DEV: 
	$(CD) ${STRINGSVC1} && $(MAKE) -f Makefile.${STRINGSVC1_NAME} -j8 ${STRINGSVC1_BIN}
	@echo MAKE $@ 

${STRINGSVC1_BIN_CLEAN}:
	$(CD) ${STRINGSVC1} && $(MAKE) -f Makefile.${STRINGSVC1_NAME} $@


