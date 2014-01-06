#!/bin/bash
## OctOs Automation Script
source build/envsetup.sh
source build/credentials.sh

## Clean Up Previous Builds
make installclean

## Current Build Date
BDATE=`date +%m-%d`
## Check to see if there are build args
## First Argument is for the -j concurrent build threads - Defaults to -j21 unless
## you set it otherwise.  Careful, or it will melt your machine!
BSPEED=$2
PUSH=$1
: ${BSPEED:="21"}
: ${PUSH:=false}

if [ ! -d "${COPY_DIR}/${BDATE}" ]; then
	echo "Creating directory for ${COPY_DIR}/${BDATE}"
	mkdir -p ${COPY_DIR}/${BDATE}
fi

echo "Starting brunch with ${BSPEED} threads for ${COPY_DIR}"
if [ ${PUSH} ]; then
echo "Pushing to Remote after build!"
fi
# jfltecan
brunch jfltecan -j${BSPEED}
find ${OUT} '(' -name '*OFFICIAL*' -size +150000k ')' -print0 |
        xargs --null md5sum |
        while read CHECKSUM FILENAME
        do
                cp ${FILENAME} ${COPY_DIR}/${BDATE}/${FILENAME##*/}
                cp "${FILENAME}.md5sum" ${COPY_DIR}/${BDATE}/${FILENAME##*/}.md5
                echo "Removing old .MD5 file ${FILENAME}.md5sum"
                rm ${OUT}/*.md5*

		if [ ${PUSH} ]; then
     			echo "Removing existing file from remote."
			ssh ${RACF}@${RHOST} 'rm -rf ~/Carrier_ROMs/*jfltecan*' < /dev/null
     			echo "Pushing new file ${FILENAME##/*} to remote"
     			scp ${FILENAME} ${RACF}@${RHOST}:~/Carrier_ROMs/${FILENAME##*/}
		fi
        done

