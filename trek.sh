#!/bin/bash
source build/envsetup.sh
make installclean
# jfltevzw
brunch oct_jfltevzw-userdebug && make installclean && make otapackage -j6
