#!/bin/bash
## OctOs Automation Script
source build/envsetup.sh

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
# jfltecri
brunch oct_jfltecri-userdebug && make installclean && make otapackage -j${BSPEED}
find ${OUT} '(' -name '*ota-eng*.zip' -size +100000k ')' -print0 |
        xargs --null md5sum |
        while read CHECKSUM FILENAME
        do
		if [ -e ${FILENAME}.md5 ]; then
		   echo "Removing old .MD5 file ${FILENAME}.md5"
		   rm "${FILENAME}.md5"
		fi
		echo "${CHECKSUM} ${BDATE}"_"${FILENAME##*/}" >> "${FILENAME}.md5"
                cp ${FILENAME} ${COPY_DIR}/${BDATE}/${BDATE}"_"${FILENAME##*/}
                cp "${FILENAME}.md5" ${COPY_DIR}/${BDATE}/${BDATE}"_"${FILENAME##*/}.md5
        done

