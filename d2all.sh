#!/bin/bash
find build '(' -name 'd2*.sh' ! -name 'd2all.sh' ')' -print |
        while read FILENAME
        do
	source ${FILENAME} $1 $2
        done

