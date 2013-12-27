#!/bin/bash
source build/envsetup.sh
make installclean
BDATE=`date +%m-%d`
COPY_DIR=/home/copy/shares/shares/dubbsy/Carrier_ROMs
if [ ! -d "${COPY_DIR}/${BDATE}" ]; then
	echo "Creating directory for ${COPY_DIR}/${BDATE}"
	mkdir -p ${COPY_DIR}/${BDATE}
fi

# jfltespr
lunch oct_jfltespr-userdebug && make installclean && make otapackage -j21
find out/target/product  '(' -name '*ota-eng*.zip' -size +100000k -print0 ')' |
        xargs --null md5sum |
        while read CHECKSUM FILENAME
        do
                echo "${CHECKSUM} ${FILENAME}" >> "${FILENAME}.md5"
                mv -f ${FILENAME} ${COPY_DIR}/${BDATE}
                mv -f "${FILENAME}.md5" ${COPY_DIR}/${BDATE}
        done

