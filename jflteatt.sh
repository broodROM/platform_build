#!/bin/bash
<<<<<<< HEAD
## OctOs Automation Script
=======
## Build Automation Scripts
##
## Copywrite 2014 - Donald Hoskins <grommish@gmail.com>
## on behalf of Team Octos et al.
>>>>>>> e815c194ff91d61a193a1f10d33907fb74d68db1

## Check to see if there are build args
## First Argument is for the -j concurrent build threads - Defaults to -j21 unless
## you set it otherwise.  Careful, or it will melt your machine!
<<<<<<< HEAD
PUSH=$1
BSPEED=$2
: ${PUSH:=false}
: ${BSPEED:="21"}
BVARIANT=`basename $0 | cut -f 1 -d "."`
build/bscript.sh ${PUSH} ${BSPEED} ${BVARIANT}

=======
BSPEED=$2
PUSH=$1
: ${BSPEED:="21"}
: ${PUSH:=false}
BVARIANT=`basename $0 | cut -f 1 -d "."`
source build/bscript.sh ${PUSH} ${BSPEED} ${BVARIANT}
>>>>>>> e815c194ff91d61a193a1f10d33907fb74d68db1
