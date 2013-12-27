#!/bin/bash
source build/envsetup.sh
make installclean
BDATE=`date +%m-%d`
COPY_DIR=/home/copy/shares/shares/dubbsy/Carrier_ROMs
if [ ! -d "${COPY_DIR}/${BDATE}" ]; then
        echo "Creating directory for ${COPY_DIR}/${BDATE}"
        mkdir -p ${COPY_DIR}/${BDATE}
fi

#VZW
lunch oct_jfltevzw-userdebug && make otapackage -j21
#SPR
lunch oct_jfltespr-userdebug && make otapackage -j21
#USC
lunch oct_jflteusc-userdebug && make otapackage -j21
#XX
lunch oct_jfltexx-userdebug && make otapackage -j21
#ATT
lunch oct_jflteatt-userdebug && make otapackage -j21
#CAN
lunch oct_jfltecan-userdebug && make otapackage -j21
#CRI
lunch oct_jfltecri-userdebug && make otapackage -j21
#CSP
lunch oct_jfltecsp-userdebug && make otapackage -j21
#TMO
lunch oct_jfltetmo-userdebug && make otapackage -j21

find out/target/product  '(' -name '*ota-eng*.zip' -size +100000k -print0 ')' |
        xargs --null md5sum |
        while read CHECKSUM FILENAME
        do
                echo "${CHECKSUM} ${FILENAME}" >> "${FILENAME}.md5"
                mv -f ${FILENAME} ${COPY_DIR}/${BDATE}
                mv -f "${FILENAME}.md5" ${COPY_DIR}/${BDATE}
        done

