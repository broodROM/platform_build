#!/bin/bash
## Build Automation Scripts
##
## Copywrite 2014 - Donald Hoskins <grommish@gmail.com>
##

find build '(' -name 'jf*.sh' ! -name 'jfall.sh' ')' -print |
        while read FILENAME
        do
	source ${FILENAME} $1 $2 `basename $0 | cut -f 1 -d "."`
        done
