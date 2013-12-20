#!/bin/bash
source build/envsetup.sh
make installclean
# jfltespr
lunch oct_jfltespr-userdebug && make installclean && make otapackage -j21
