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

if [ ! -z "$1" ]; then
	unset GOTUTORIAL 
	unset GOTUTORIAL_PHONY 
	unset GOTUTORIAL_PHONY_CLEAN

	if [ "${HAVE_PRJ_GOTUTORIAL}" = "1" ]; then
		export GOTUTORIAL="$1"
		export GOTUTORIAL_PHONY="GOTUTORIAL"
		export GOTUTORIAL_PHONY_CLEAN="GOTUTORIAL_CLEAN"
    #export GOPATH=${GOTUTORIAL}
		echo "GOTUTORIAL=${GOTUTORIAL}"
	fi
else
	export HAVE_PRJ_GOTUTORIAL=1
	export HAVE_LIB_EXTERNAL=1
	export HAVE_01_GOHELLO=1
	export HAVE_02_PROTOBUFFER=1
	export HAVE_03_GRPCHELLO=1
	export HAVE_04_GRPCFTP=1
	export HAVE_05_GINWEBSER=1
	export HAVE_05_GINWEBSERTEST=1
	export HAVE_06_SWAGGERCODEGEN=1
	export HAVE_07_GOKITSAMPLES=1

	# load global env
	source mk/source.sh
fi
