/*--------------------------------*- C++ -*----------------------------------*\
| =========                 |                                                 |
| \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           |
|  \\    /   O peration     | Version:  2.1.x                                 |
|   \\  /    A nd           | Web:      www.OpenFOAM.org                      |
|    \\/     M anipulation  |                                                 |
\*---------------------------------------------------------------------------*/

  probes
  {
      functionObjectLibs ( "libsampling.so" );

      type probes;

      name probes;

      fields
      (
        U
	p
      );

      probeLocations
      (
        (0.65 0.078 0)
        (0.65 0.1 0)
        (0.05 0.06 0)
        (1.02 0.01 0)
      );
  }

  probesAveraged
  {
      functionObjectLibs ( "libsampling.so" );

      type probes;

      name probes;

      fields
      (
        UMean
	pMean
      );

      probeLocations
      (
        (0.65 0.078 0)
        (0.65 0.1 0)
        (0.05 0.06 0)
        (1.02 0.01 0)
      );
  }



// ************************************************************************* //
