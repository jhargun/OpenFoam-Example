#!/bin/bash
# --------------------------------------------------------------------------- #
#   ==   ===  ==                                                              #
#  ||   ||=  || ))  support s. r. o. 2014, www.cfdsupport.com                 #
#   ==        ==                                                              #
# --------------------------------------------------------------------------- #
#cd ${0%/*} || exit 1    # run from this directory

echo "--------"
echo "Cleaning tutorials ..."
echo "Removing backup files"

find . -type f \( -name "*~" -o -name "*.bak" -name "*.dat" \) -exec rm {} \;
find . \( -name core -o -name 'core.[1-9]*' \) -exec rm {} \;
find . \( -name '*.pvs' \) -exec rm {} \;
find . \( -name 'processor[0-9]*' \) -exec rm -rf {} \;
find . -type d \( -name '[1-9]*' \) -exec rm -rf {} \;
find . -type d \( -name '[0-9]*.[0-9]*' \) -exec rm -rf {} \;


rm 0/alphat 0/mut *~ *.dat *.pdf logs testLoopReport log *.log log* ptp1 ptp2 ptp3 vtp1 vtp2 vtp3 tmp RPM* vtp* ptp* ttp* *In *Out tmp* *.OpenFOAM *.png *.eps calc* number* rotor-inlet rotor-outlet stator-inlet stator-outlet > /dev/null 2>&1
rm -rf patchMass*
rm -rf postProcessing*
rm -rf forces*
rm -rf efficiency
rm -rf 0
rm -rf probes

echo "--------"

# ----------------------------------------------------------------- end-of-file
