#!/bin/bash
source build/envsetup.sh
make installclean
BDATE=(date +%m-%d)
COPY_DIR=/home/copy/shares/shares/dubbsy/Carrier_ROMs


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


find out/target/product  '(' -name '*.zip' -size +100000k -print0 ')' |
        xargs --null md5sum |
        while read CHECKSUM FILENAME
        do
                echo "${CHECKSUM} ${FILENAME}" >> "${FILENAME}.desc"
                mv ${FILENAME} ${COPY_DIR}/Oct_${BDATE}
                mv "${FILENAME}.desc" ${COPY_DIR}/Oct_${BDATE}
        done

