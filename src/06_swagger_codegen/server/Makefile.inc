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
GOSWAGGERCODEGENSERVER: ${GOSWAGGERCODEGENSERVER_BIN}
	@echo MAKE GOSWAGGERCODEGENSERVER 

GOSWAGGERCODEGENSERVER_CLEAN: ${GOSWAGGERCODEGENSERVER_BIN_CLEAN}
	@echo MAKE GOSWAGGERCODEGENSERVER_CLEAN 

${GOSWAGGERCODEGENSERVER_BIN}:
	$(CD) ${GOSWAGGERCODEGENSERVER} && $(MAKE) -f Makefile.${GOSWAGGERCODEGENSERVER_NAME} -j8 $@

GOSWAGGERCODEGENSERVER_DEV: 
	$(CD) ${GOSWAGGERCODEGENSERVER} && $(MAKE) -f Makefile.${GOSWAGGERCODEGENSERVER_NAME} -j8 ${GOSWAGGERCODEGENSERVER_BIN}
	@echo MAKE $@ 

${GOSWAGGERCODEGENSERVER_BIN_CLEAN}:
	$(CD) ${GOSWAGGERCODEGENSERVER} && $(MAKE) -f Makefile.${GOSWAGGERCODEGENSERVER_NAME} $@

