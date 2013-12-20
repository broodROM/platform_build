#!/bin/bash
source build/envsetup.sh
make installclean
# jfltexx
lunch oct_jfltexx-userdebug && make installclean && make otapackage -j21
