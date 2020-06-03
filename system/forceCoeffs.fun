/*--------------------------------*- C++ -*----------------------------------*\
| =========                 |                                                 |
| \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           |
|  \\    /   O peration     | Version:  2.3.0                                 |
|   \\  /    A nd           | Web:      www.OpenFOAM.org                      |
|    \\/     M anipulation  |                                                 |
\*---------------------------------------------------------------------------*/

forceCoeffs1
{
    type        forceCoeffs;

    functionObjectLibs ( "libforces.so" );

    outputControl   timeStep;
    timeInterval    1;

    log         yes;

    patches     (solidWall);
    //pName       p;
    //UName       U;
    //rhoName     rhoInf;      // Indicates incompressible
    p p;
    U U;
    rho rhoInf;
    log         true;
    rhoInf      1.203;           // Redundant for incompressible
    //No longer true: see readme // Lift is +y direction, drag is +x, pitch is +z AXIS (RHR) 

    //liftDir     (0 1 0);
    liftDir     (0 0 1);
    pitchAxis   (0 1 0);

    dragDir     (1 0 0);
    //CofR        (0.5 0.05 0);  // Axle midpoint on ground
    CofR	(0 0 0);  //This is used for moment calculations, not center of airfoil so ignore moments 
    //pitchAxis   (0 0 1);
    //magUInf     30;
    //lRef        1.0;        // Wheelbase length
    //Aref        0.0128;        // Estimated // c7 half model cca 1m2
    magUInf	90;
    lRef	.2;
    Aref	.4;
/*
    binData
    {
        nBin        20;          // output data into 20 bins
        direction   (1 0 0);     // bin direction
        cumulative  yes;
    }*/
}
forces1
{
    type        forces;

    functionObjectLibs ( "libforces.so" );

    outputControl   timeStep;
    timeInterval    1;

    log         yes;

    patches     (solidWall);
    //pName       p;
    //UName       U;
    //rhoName     rhoInf;      // Indicates incompressible
    p p;
    U U;
    rho rhoInf;
    log         true;
    rhoInf	1.203;
    //rhoInf      1;           // Redundant for incompressible
    
    //liftDir     (0 1 0);
    liftDir     (0 0 1);
    pitchAxis   (0 1 0);

    dragDir     (1 0 0);
    //CofR        (0.5 0.05 0);  // Axle midpoint on ground
    CofR (0 0 0);
    //pitchAxis   (0 0 1);
    //magUInf     30;
    //lRef        1.0;        // Wheelbase length
    //Aref        0.0128;        // Estimated // c7 half model cca 1m2
    magUInf	90;
    lRef	.2;
    Aref	.4;
/*
    binData
    {
        nBin        20;          // output data into 20 bins
        direction   (1 0 0);     // bin direction
        cumulative  yes;
    }*/
}

forceCoeffsAveraged1
{
    type        forceCoeffs;

    functionObjectLibs ( "libforces.so" );

    outputControl   timeStep;
    timeInterval    1;

    log         yes;

    patches     (solidWall);
    //pName       pMean;
    //UName       UMean;
    //rhoName     rhoInf;      // Indicates incompressible
    p p;
    U U;
    rho rhoInf;
    log         true;
    rhoInf      1.203;           // Redundant for incompressible
    //liftDir     (0 1 0);
    liftDir     (0 0 1);
    pitchAxis   (0 1 0);

    dragDir     (1 0 0);
    //CofR        (0.5 0.05 0);  // Axle midpoint on ground
    CofR	(0 0 0);
    //pitchAxis   (0 0 1);
    //magUInf     30;
    //lRef        1.0;        // Wheelbase length
    //Aref        0.0128;        // Estimated // c7 half model cca 1m2
    magUInf	90;
    lRef	.2;
    Aref	.4;
/*
    binData
    {
        nBin        20;          // output data into 20 bins
        direction   (1 0 0);     // bin direction
        cumulative  yes;
    }*/
}
forcesAveraged1
{
    type        forces;

    functionObjectLibs ( "libforces.so" );

    outputControl   timeStep;
    timeInterval    1;

    log         yes;

    patches     ( solidWall);
    //pName       pMean;
    //UName       UMean;
    //rhoName     rhoInf;      // Indicates incompressible
    p p;
    U U;
    rho rhoInf;
    log         true;
    rhoInf      1.203;           // Redundant for incompressible
    //liftDir     (0 1 0);
    liftDir     (0 0 1);
    pitchAxis   (0 1 0);

    dragDir     (1 0 0);
    //CofR        (0.5 0.05 0);  // Axle midpoint on ground
    CofR	(0 0 0);
    //pitchAxis   (0 0 1);
    //magUInf     30;
    //lRef        1.0;        // Wheelbase length
    //Aref        0.0128;        // Estimated // c7 half model cca 1m2
    magUInf	90;
    lRef	.2;
    Aref	.4;
/*
    binData
    {
        nBin        20;          // output data into 20 bins
        direction   (1 0 0);     // bin direction
        cumulative  yes;
    }*/
}

// ************************************************************************* //
