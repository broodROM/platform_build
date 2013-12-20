#!/bin/bash
source build/envsetup.sh
make installclean
# jfltetmo
lunch oct_jfltetmo-userdebug && make installclean && make otapackage -j21
