#!/bin/bash
source build/envsetup.sh
make installclean
# jfltecri
lunch oct_jfltecri-userdebug && make installclean && make otapackage -j21
