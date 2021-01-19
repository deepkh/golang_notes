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
	unset PROTOBUFFER_PHONY
	unset PROTOBUFFER_PHONY_DEV
	unset PROTOBUFFER_PHONY_CLEAN
	if [ "${HAVE_02_PROTOBUFFER}" = "1" ]; then
		export PROTOBUFFER="$1"
		export PROTOBUFFER_PHONY="PROTOBUFFER"
		export PROTOBUFFER_PHONY_DEV="PROTOBUFFER_DEV"
		export PROTOBUFFER_PHONY_CLEAN="PROTOBUFFER_CLEAN"
		echo "PROTOBUFFER=${PROTOBUFFER}"
		
		export BINPROTOBUFFER_NAME="protobuffer"
		export BINPROTOBUFFER="$1"
		export BINPROTOBUFFER_OBJS_DIR=${RUNTIME_OBJS}${BINPROTOBUFFER/${ROOT}/""}
		export BINPROTOBUFFER_BIN="${RUNTIME_BIN}/${BINPROTOBUFFER_NAME}${BINSUFFIX}"
		export BINPROTOBUFFER_BIN_CLEAN="${BINPROTOBUFFER_BIN}_clean"
		export BINPROTOBUFFER_PHONY="BINPROTOBUFFER"
		export BINPROTOBUFFER_PHONY_DEV="BINPROTOBUFFER_DEV"
		export BINPROTOBUFFER_PHONY_CLEAN="BINPROTOBUFFER_CLEAN"
		export BINPROTOBUFFER_CFLAGS=
		export BINPROTOBUFFER_LDFLAGS=
		echo "BINPROTOBUFFER=${BINPROTOBUFFER}"

		export HAVE_PBPROTOBUFFER=1
		export HAVE_GO_PROTOBUFFER=1
	fi
fi

