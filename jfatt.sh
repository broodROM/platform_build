#!/bin/bash
source build/envsetup.sh
make installclean
# jflteatt
lunch oct_jflteatt-userdebug && make installclean && make otapackage -j21
