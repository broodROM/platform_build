#!/bin/bash
source build/envsetup.sh
make installclean
# jfltecan
lunch oct_jfltecan-userdebug && make installclean && make otapackage -j21
