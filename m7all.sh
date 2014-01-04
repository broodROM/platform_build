#!/bin/bash
find build '(' -name 'm7*.sh' ! -name 'm7all.sh' ')' -print |
        while read FILENAME
        do
	source ${FILENAME} $1 $2
        done

