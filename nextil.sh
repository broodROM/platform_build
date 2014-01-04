#!/bin/bash
## OctOs Automation Script
source build/envsetup.sh

## Clean Up Previous Builds
make installclean

## Current Build Date
BDATE=`date +%m-%d`
## Check to see if there are build args
## First Argument is for the -j concurrent build threads - Defaults to -j21 unless
## you set it otherwise.  Careful, or it will melt your machine!
BSPEED=$1
TEST=$2
: ${BSPEED:="21"}
: ${TEST:=false}

if ${TEST} ; then
COPY_DIR=/home/copy/shares/Octos/dubbsy/Carrier_ROMs/test_builds
else
COPY_DIR=/home/copy/shares/Octos/dubbsy/Carrier_ROMs
fi

if [ ! -d "${COPY_DIR}/${BDATE}" ]; then
	echo "Creating directory for ${COPY_DIR}/${BDATE}"
	mkdir -p ${COPY_DIR}/${BDATE}
fi

echo "Starting brunch with ${BSPEED} threads for ${COPY_DIR}"
# tilapia
brunch tilapia -j${BSPEED}
find ${OUT} '(' -name '*OFFICIAL*' -size +150000k ')' -print0 |
        xargs --null md5sum |
        while read CHECKSUM FILENAME
        do
		if [ -e ${FILENAME}.md5 ]; then
		   echo "Removing old .MD5 file ${FILENAME}.md5sum"
		   rm "${FILENAME}.md5sum"
		fi
                cp ${FILENAME} ${COPY_DIR}/${BDATE}/${BDATE}"_"${FILENAME##*/}
                cp "${FILENAME}.md5sum" ${COPY_DIR}/${BDATE}/${BDATE}"_"${FILENAME##*/}.md5
        done

