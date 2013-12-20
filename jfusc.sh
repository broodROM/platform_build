#!/bin/bash
source build/envsetup.sh
make installclean
# jflteusc
lunch oct_jflteusc-userdebug && make installclean && make otapackage -j21
