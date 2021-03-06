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
#!/bin/bash

if [ ! -z "$1" ]; then
	unset GOSWAGGERCODEGENSERVER_PHONY
	unset GOSWAGGERCODEGENSERVER_PHONY_CLEAN
	if [ "${HAVE_06_SWAGGERCODEGENSERVER}" = "1" ]; then
		export GOSWAGGERCODEGENSERVER_NAME="goswaggercodegen_server"
		export GOSWAGGERCODEGENSERVER="$1"
		export GOSWAGGERCODEGENSERVER_OBJS_DIR=
		export GOSWAGGERCODEGENSERVER_BIN="${RUNTIME_BIN}/${GOSWAGGERCODEGENSERVER_NAME}${BINSUFFIX}"
		export GOSWAGGERCODEGENSERVER_BIN_CLEAN="${GOSWAGGERCODEGENSERVER_BIN}_clean"
		export GOSWAGGERCODEGENSERVER_PHONY="GOSWAGGERCODEGENSERVER"
		export GOSWAGGERCODEGENSERVER_PHONY_DEV="GOSWAGGERCODEGENSERVER_DEV"
		export GOSWAGGERCODEGENSERVER_PHONY_CLEAN="GOSWAGGERCODEGENSERVER_CLEAN"
		export GOSWAGGERCODEGENSERVER_CFLAGS=
		export GOSWAGGERCODEGENSERVER_LDFLAGS=
		echo "GOSWAGGERCODEGENSERVER=${GOSWAGGERCODEGENSERVER}"
	fi

fi


