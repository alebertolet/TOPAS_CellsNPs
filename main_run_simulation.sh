#!/bin/bash

CURRENTPATH=`pwd`
# RUNDIR="${CURRENTPATH}/work/${1:-TestRunDir}"
# CONFIGFILE="SimulationConfigFile.txt"
#mkdir -p $RUNDIR

python3 pythonscripts/run_simulation.py $CURRENTPATH

# cp $CONFIGFILE $RUNDIR
# cp -r ./runFiles/* $RUNDIR
# cp -r sourcePHSPFiles $RUNDIR

#cp -r ./supportFiles/* "${RUNDIR}/supportFiles"

RUNDIR=$(grep "runDirectoryName" SimulationConfigFile.txt | awk -F'= ' '{print $2}' | cut -d'#' -f1 | tr -d ' ')
RUNDIR="${CURRENTPATH}/work/$RUNDIR"
echo $RUNDIR
cd $RUNDIR

dos2unix submit_script.sh
chmod +x submit_script.sh
./submit_script.sh

