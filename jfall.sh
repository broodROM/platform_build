#!/bin/bash
source build/envsetup.sh
make installclean
#ATT
lunch oct_jflteatt-userdebug && make installclean && make otapackage -j21
#CAN
lunch oct_jfltecan-userdebug && make installclean && make otapackage -j21
#CRI
lunch oct_jfltecri-userdebug && make installclean && make otapackage -j21
#CSP
lunch oct_jfltecsp-userdebug && make installclean && make otapackage -j21
#SPR
lunch oct_jfltespr-userdebug && make installclean && make otapackage -j21
#TMO
lunch oct_jfltetmo-userdebug && make installclean && make otapackage -j21
#USC
lunch oct_jflteusc-userdebug && make installclean && make otapackage -j21
#VZW
lunch oct_jfltevzw-userdebug && make installclean && make otapackage -j21
#XX
lunch oct_jfltexx-userdebug && make installclean && make otapackage -j21
