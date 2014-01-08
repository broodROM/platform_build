#!/bin/bash
## Build Automation Scripts
##
## Copywrite 2014 - Donald Hoskins <grommish@gmail.com>
## on behalf of Team Octos et al.

PUSH=$1
BSPEED=$2
: ${PUSH:=false}
: ${BSPEED:="21"}

find build '(' -name 'jf*.sh' ! -name 'jfall.sh' ')' -print |
        while read FILENAME
        do
	${FILENAME} ${PUSH} ${BSPEED}
        done
