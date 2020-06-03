#!/bin/bash
# --------------------------------------------------------------------------- #
#   ==   ===  ==                                                              #
#  ||   ||=  || ))  support s. r. o. 2015, www.cfdsupport.com                 #
#   ==        ==                                                              #
# --------------------------------------------------------------------------- #
# script for running Turbulence CFD Training
# http://turbmodels.larc.nasa.gov/naca4412sep_val.html

STARTTIME=$(date +%s)
echo "$STARTTIME"

# # #######-----LES - alright
 turbulence=RANS
 solver=simpleFoam
 mode=incompressible
 wall=wallFunction
 endTime=1500  
  deltaT=1
 NProc=8
 mesh=custom_made
turbulenceModel=kOmegaSST

# # 
# # # #######-----LES - pimple
#turbulence=LES
#solver=pimpleFoam
#mode=incompressible
#wall=wallFunction 
#endTime=1  
#deltaT=0.0001 
#NProc=4
#mesh=3.5k 
#LESModel=SpalartAllmarasDDES
# #  

##All options
####################################################################
#  solver=pimpleFoam #simpleFoam #rhoSimpleFoam #pisoFoam #pimpleFoam 
#  mode=incompressible            #compressible/incompressible
#  wall=wallFunction   		#wallFunction/lowRe
#  endTime=0.00001      #when to end 
#  deltaT=0.0000001     #time step (in steady state just counter) 
#  NProc=6		  #number of cores in parallel
#  mesh=3.5k  #3.5k 14k 57k 229k
# turbulenceModel=laminar
# turbulenceModel=kOmegaSST
# turbulenceModel=realizableKE
# turbulenceModel=SpalartAllmaras
# turbulenceModel=kEpsilon
# turbulenceModel=RNGkEpsilon
# turbulenceModel=LaunderSharmaKE
# turbulenceModel=LRR     		#lowRe #RSM 
# turbulenceModel=LaunderGibsonRSTM 	#lowRe #RSM
#               only imcompressible:
# turbulenceModel=v2f   		#lowRe
# turbulenceModel=kkLOmega   		#lowRe
# turbulenceModel=LamBremhorstKE  	#lowRe
# turbulenceModel=LienCubicKE		#lowRe
# turbulenceModel=LienCubicKELowRe	#lowRe
# turbulenceModel=LienLeschzinerLowRe	#lowRe
# turbulenceModel=NonlinearKEShih	#lowRe
# turbulenceModel=qZeta			#lowRe


# LESModel=laminar
# LESModel=oneEqEddy
# LESModel=SpalartAllmarasDDES
# LESModel=DeardorffDiffStress
# LESModel=LRRDiffStress
# LESModel=Smagorinsky
# LESModel=SpalartAllmaras
# LESModel=SpalartAllmarasIDDES
# LESModel=dynLagrangian
# LESModel=dynOneEqEddy
# LESModel=homogeneousDynOneEqEddy
# LESModel=homogeneousDynSmagorinsky
# LESModel=kOmegaSSTSAS
# LESModel=mixedSmagorinsky
# LESModel=spectEddyVisc

# yGrading=50000  
# yGrading=5000 
# yGrading=2000 
# yGrading=1000 
# yGrading=800  
# yGrading=500  
# yGrading=200  
# yGrading=100  
# yGrading=50   
# yGrading=10   


#################################################################################################

U=90;

#---------------------------------------------------------------------------------------------------------------------------
echo "  "
echo "-------------------------------------------------------------------"
echo "-------------------------------------------------------------------"
echo "RUNNING TEST CASE  ${PWD##*/}, $turbulenceModel, U = $U [m/s]"
echo "turbulence=$turbulence, mode=$mode,  wall=$wall"
echo "mesh=$mesh, NProc=$NProc", deltaT=$deltaT, endTime=$endTime
echo "-------------------------------------------------------------------"
echo "-------------------------------------------------------------------"
echo "  "
#---------------------------------------------------------------------------------------------------------------------------


# set number of subdomains for decomposition
sed -i "s/\(.*numberOfSubdomains[ \t]*\)[0-9].*;/numberOfSubdomains $NProc;/g" system/decomposeParDict


nu="$(printf '%.8f' $(grep '^\s*nu' constant/transportProperties | sed 's/\s*nu.*]\s*\(.*\)\s*;.*$/\1/g'))"


bash ./Allclean.sh

rm -rf 0
cp -r 0.org 0
cp system/controlDict.$solver system/controlDict
cp system/fvSolution.$solver system/fvSolution
cp system/fvSchemes.$solver system/fvSchemes


#if [ "$mesh" == "3.5k" ];
#then
#	rm -rf constant/polyMesh
#        cp -rf constant/polyMesh-3.5k constant/polyMesh
#fi
#
#if [ "$mesh" == "14k" ];
#then
#	rm -rf constant/polyMesh
#        cp -rf constant/polyMesh-14k constant/polyMesh
#fi
#
#if [ "$mesh" == "57k" ];
#then
#	rm -rf constant/polyMesh
#        cp -rf constant/polyMesh-57k constant/polyMesh
#fi
#
#if [ "$mesh" == "229k" ];
#then
#	rm -rf constant/polyMesh
#        cp -rf constant/polyMesh-229k constant/polyMesh
#fi


if [ "$wall" == "lowRe" ];
then
	    cp 0/k.lowRe 0/k
	    cp 0/epsilon.lowRe 0/epsilon
	    cp 0/nuTilda.lowRe 0/nuTilda
	    cp 0/nut.lowRe 0/nut 
	    cp 0/mut.lowRe 0/mut 
	    cp 0/omega.lowRe 0/omega
fi

if [ "$mode" == "incompressible" ];
then
	#sed -i "s/compressible:://g" 0/*
        sed -i "s/dimensions\ \[1\ -1\ -2/dimensions\ \[0\ 2\ -2/g" 0/p
fi


if [ "$turbulence" == "LES" ];
then
sed -i "s/\(^[ \t]*simulationType\).*[0-9]*;.*$/\1 LES;/g" constant/turbulenceProperties
sed -i "s/\(^[ \t]*LESModel\).*[0-9]*;.*$/\1 ${LESModel};/g" constant/turbulenceProperties
	    cp 0/k.les 0/k
	    cp 0/U.les 0/U
	    cp 0/nuTilda.les 0/nuTilda
fi

if [ "$turbulence" == "RANS" ];
then
sed -i "s/\(^[ \t]*simulationType\).*[0-9]*;.*$/\1 RAS;/g" constant/turbulenceProperties
sed -i "s/\(^[ \t]*RASModel\).*[0-9]*;.*$/\1 ${turbulenceModel};/g" constant/turbulenceProperties
fi


if [ "$solver" == "simpleFoam" ];
then
sed -i "s/\(^[ \t]*resetOnOutput\).*[0-9]*;.*$/\1 true;/g" system/fieldAverages.fun
fi



sed -i "s/\(^[ \t]*resetOnOutput\).*[0-9]*;.*$/\1 false;/g" system/fieldAverages.fun

sed -i "s/\(^[ \t]*endTime\).*[0-9]*;.*$/\1 ${endTime};/g" system/controlDict

sed -i "s/\(^[ \t]*deltaT\).*[0-9]*;.*$/\1 ${deltaT};/g" system/controlDict


# 
# echo "Mesh generation..."
# ./constant/polyMesh/createDict_blockMeshDict $Nx $Ny $yGrading > ./constant/polyMesh/blockMeshDict
# blockMesh > log.blockMesh

echo "Renumbering mesh ..."
renumberMesh -overwrite | tee -a log > renumberMesh.log  2>&1 

echo "Running solver potentialFoam ..."
potentialFoam -noFunctionObjects | tee -a log > log.potentialFoam 2>&1
#rm 0/phi



if [ "$NProc" == "1" ]; 
then
echo "Running solver $solver ..."
$solver | tee -a log > log.$solver 2>&1
fi



if [ $NProc -gt "1" ];
then
echo "Decomposing computational mesh..."
decomposePar -force | tee -a log > log.decomposePar 2>&1 
echo "Running solver $solver ..."
mpiexec -np $NProc $solver -parallel | tee -a log > log.$solver 2>&1
echo "Reconstructing computational mesh..."
reconstructPar > log.reconstructPar
fi



#echo "Sampling data ..."
#sample | tee -a log > log.sample 2>&1

bash ./writeResiduals.sh 

echo "Plotting results ..."
gnuplot plotFinalResults.gp | tee -a log > log.gnuplot &

if [ "$turbulence" == "RANS" ];
then
   if  [ "$mode" == "compressible" ];
   then
	  yPlus > log.yPlus
   fi
   if  [ "$mode" == "incompressible" ];
   then
	  yPlus > log.yPlus
   fi
fi


echo " Allrun.sh   DONE!!!!! "
ENDTIME=$(date +%s)
echo "It takes $(($ENDTIME - $STARTTIME)) seconds to complete this task..."
echo "It takes $(($ENDTIME - $STARTTIME)) seconds to complete this task..." > timeElapsed.txt
