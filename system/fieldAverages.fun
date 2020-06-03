/*--------------------------------*- C++ -*----------------------------------*\
| =========                 |                                                 |
| \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           |
|  \\    /   O peration     | Version:  2.1.x                                 |
|   \\  /    A nd           | Web:      www.OpenFOAM.org                      |
|    \\/     M anipulation  |                                                 |
\*---------------------------------------------------------------------------*/

 fieldAverage1
    {
        // Type of functionObject
        type            fieldAverage;

        // Where to load it from (if not already in solver)
        functionObjectLibs ("libfieldFunctionObjects.so");

        // Function object enabled flag
        enabled         true;

        // When to output the average fields
        outputControl   outputTime;

        // Region option
	// region rotor

        // Reset on output
        resetOnOutput false;
	
        // Fields to be averaged - runTime modifiable
        fields
        (
            U
            {
                mean        on;
                prime2Mean  off;
                base        time;
                // window      100; // optional averaging window
            }

            p
            {
                mean        on;
                prime2Mean  off;
                base        time;
               // window      100; // optional averaging window
            }
        );
    }





// ************************************************************************* //
