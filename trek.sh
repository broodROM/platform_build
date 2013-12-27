#!/bin/bash
source build/envsetup.sh
make installclean
# jfltevzw
lunch oct_jfltevzw-userdebug && make installclean && make otapackage -j6
