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
	unset GOKITSAMPLES_PHONY
	unset GOKITSAMPLES_PHONY_CLEAN
	if [ "${HAVE_07_GOKITSAMPLES}" = "1" ]; then
		# Gen openapi go server stub
		export GOKITSAMPLES_NAME="gokitsamples"
		export GOKITSAMPLES="$1"
		export GOKITSAMPLES_OBJS_DIR=
		export GOKITSAMPLES_PHONY="GOKITSAMPLES"
		export GOKITSAMPLES_PHONY_DEV="GOKITSAMPLES_DEV"
		export GOKITSAMPLES_PHONY_CLEAN="GOKITSAMPLES_CLEAN"
		export GOKITSAMPLES_CFLAGS=""
		export GOKITSAMPLES_LDFLAGS=""
		echo "GOKITSAMPLES=${GOKITSAMPLES}"
	fi
fi
