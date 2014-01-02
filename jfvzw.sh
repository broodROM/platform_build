#!/bin/bash
## OctOs Automation Script
source build/envsetup.sh

## Current Build Date
BDATE=`date +%m-%d`
## Check to see if there are build args
## First Argument is for the -j concurrent build threads - Defaults to -j21 unless
## you set it otherwise.  Careful, or it will melt your machine!
if [ ! -z $1 ]; then
	$1 = 21
fi

## Arg 2 is for Test vs Production.  True (y/1) means Test build, n/0 means Production
## Defaults to Production 
if [ ! -z $2 ]; then
        $1 = n
fi

TEST_BUILD=$2
if [ TEST_BUILD ]; then
COPY_DIR=/home/copy/shares/Octos/dubbsy/Carrier_ROMs/test_builds
else
COPY_DIR=/home/copy/shares/Octos/dubbsy/Carrier_ROMs
fi

if [ ! -d "${COPY_DIR}/${BDATE}" ]; then
	echo "Creating directory for ${COPY_DIR}/${BDATE}"
	mkdir -p ${COPY_DIR}/${BDATE}
fi

# jfltevzw
lunch oct_jfltevzw-userdebug && make installclean && make otapackage -j$1
find out/target/product '(' -name '*ota-eng*.zip' -size +100000k ')' -print0 |
        xargs --null md5sum |
        while read CHECKSUM FILENAME
        do
                echo "${CHECKSUM} ${FILENAME}" >> "${FILENAME}.md5"
                cp $OUT/${FILENAME} ${COPY_DIR}/${BDATE}/${BDATE}"_"${FILENAME##*/}
                cp $OUT/"${FILENAME}.md5" ${COPY_DIR}/${BDATE}/${BDATE}"_"${FILENAME##*/}.md5
        done

