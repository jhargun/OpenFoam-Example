set title "Convergence process"
set xlabel "Iterations"
set ylabel "Residuals"
set logscale y;
set grid
plot "residualsUx.dat" title 'Ux',\
     "residualsUy.dat" title 'Uy',\
     "residualsP.dat" title 'p',\
     "residualsOmega.dat" title 'omega',\
     "residualsEpsilon.dat" title 'epsilon',\
     "residualsK.dat" title 'k',\
     "residualsKt.dat" title 'kt',\
     "residualsKl.dat" title 'kl',\
     "residualsNuTilda.dat" title 'nuTilda',\
     "residualsV2.dat" title 'v2',\
     "residualsF.dat" title 'f',\
     "residualsE.dat" title 'e' 
pause mouse