#!/bin/bash
find build '(' -name 'jf*.sh' ! -name 'jfall.sh' ')' -print |
        while read FILENAME
        do
	source ${FILENAME} $1 $2
        done

