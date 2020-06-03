#!/bin/sh

cat log | grep  Ux | cut -d' ' -f9 | tr -d ',' > residualsUx.dat
cat log | grep  Uy | cut -d' ' -f9 | tr -d ',' > residualsUy.dat
cat log | grep  p, | cut -d' ' -f9 | tr -d ',' > residualsP.dat
cat log | grep  omega, | cut -d' ' -f9 | tr -d ',' > residualsOmega.dat
cat log | grep  epsilon, | cut -d' ' -f9 | tr -d ',' > residualsEpsilon.dat
cat log | grep  k, | cut -d' ' -f9 | tr -d ',' > residualsK.dat
cat log | grep  kt, | cut -d' ' -f9 | tr -d ',' > residualsKt.dat
cat log | grep  kl, | cut -d' ' -f9 | tr -d ',' > residualsKl.dat
cat log | grep  nuTilda, | cut -d' ' -f9 | tr -d ','> residualsNuTilda.dat
cat log | grep  v2, | cut -d' ' -f9 | tr -d ',' > residualsV2.dat
cat log | grep  f, | cut -d' ' -f9 | tr -d ',' > residualsF.dat
cat log | grep  e, | cut -d' ' -f9 | tr -d ',' > residualsE.dat

