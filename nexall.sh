#!/bin/bash
find build '(' -name 'nex*.sh' ! -name 'nexall.sh' ')' -print |
        while read FILENAME
        do
	source ${FILENAME} $1 $2
        done

