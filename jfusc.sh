#!/bin/bash
source build/envsetup.sh
make installclean
BDATE=(date +%m-%d)
COPY_DIR=/home/copy/shares/shares/dubbsy/Carrier_ROMs
# jflteusc
lunch oct_jflteusc-userdebug && make installclean && make otapackage -j21
find out/target/product  '(' -name '*.zip' -size +100000k -print0 ')' |
        xargs --null md5sum |
        while read CHECKSUM FILENAME
        do
                echo "${CHECKSUM} ${FILENAME}" >> "${FILENAME}.desc"
                mv ${FILENAME} ${COPY_DIR}/Oct_${BDATE}
                mv "${FILENAME}.desc" ${COPY_DIR}/Oct_${BDATE}
        done

