#!/bin/bash
source build/envsetup.sh
make installclean
# jfltecsp
lunch oct_jfltecsp-userdebug && make installclean && make otapackage -j21
