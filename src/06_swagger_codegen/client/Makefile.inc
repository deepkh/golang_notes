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
GOSWAGGERCODEGENCLIENT: ${GOSWAGGERCODEGENCLIENT_BIN}
	@echo MAKE GOSWAGGERCODEGENCLIENT 

GOSWAGGERCODEGENCLIENT_CLEAN: ${GOSWAGGERCODEGENCLIENT_BIN_CLEAN}
	@echo MAKE GOSWAGGERCODEGENCLIENT_CLEAN 

${GOSWAGGERCODEGENCLIENT_BIN}:
	$(CD) ${GOSWAGGERCODEGENCLIENT} && $(MAKE) -f Makefile.${GOSWAGGERCODEGENCLIENT_NAME} -j8 $@

GOSWAGGERCODEGENCLIENT_DEV: 
	$(CD) ${GOSWAGGERCODEGENCLIENT} && $(MAKE) -f Makefile.${GOSWAGGERCODEGENCLIENT_NAME} -j8 ${GOSWAGGERCODEGENCLIENT_BIN}
	@echo MAKE $@ 

${GOSWAGGERCODEGENCLIENT_BIN_CLEAN}:
	$(CD) ${GOSWAGGERCODEGENCLIENT} && $(MAKE) -f Makefile.${GOSWAGGERCODEGENCLIENT_NAME} $@


