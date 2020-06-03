set style line 1 lt 1 lw 7 lc rgb "#FF0000"
set style line 2 lt 2 lw 4 lc rgb "orange"
set style line 3 lt 1 lw 7 lc rgb "#00C000"
set style line 4 lt 2 lw 7 lc rgb "#0000FF"
set style line 5 lt 1 lw 7 lc rgb "#9400D3"
set style line 6 lt 2 lw 7 lc rgb "#FF0000"
set style line 7 lt 2 lw 7 lc rgb "#00C000"


set style line 8 lt 1 lw 5 lc rgb "black"
set style line 9 lt 2 lw 5 lc rgb "#777777"


set title 'NACA4412 Prassure Coefficient - Cp [ - ]'
set output 'Cp.svg'
set ylabel "Cp" offset -1
set xlabel "x/c"
set grid
set yrange [] reverse

plot [-0.01:1.01][]\
  "origData/NASA.raw"  using 1:3 with linespoints ps 0.1 pt 6 lw 2 lc rgb "black" title 'NASA exp',\
  "origData/NASA_SA.raw" with linespoints ps 0.1  pt 6lw 2 lc rgb "#777777" title 'NASA SA',\
   "postProcessing/surfaces/5000/pMean_airfoilData.raw" using 1:($4/(0.5*900)) with linespoints ps 0.1  pt 6lw 2 lc rgb "red" title '(current model performance)'

pause 10


# 
# set terminal svg 
# set title 'NACA4412 Prassure Coefficient - Cp [ - ]'
# set output 'Cp.pdf'
# set ylabel "Cp" offset -1
# set xlabel "x/c"
# set grid
# set yrange [] reverse
# 
# plot [-0.01:1.01][]\
#   "origData/NASA.raw"  using 1:3 with linespoints ps 0.1 pt 6 lw 2 lc rgb "black" title 'NASA exp',\
#   "origData/NASA_SA.raw" with linespoints ps 0.1  pt 6lw 2 lc rgb "#777777" title 'NASA SA',\
#    "postProcessing/surfaces/5e-005/pMean_airfoilData.raw" using 1:($4/(0.5*900)) with linespoints ps 0.1  pt 6lw 2 lc rgb "red" title '(current model performance)'
 
# set terminal pdf size 12cm,8cm
# set title 'NACA4412 Prassure Coefficient - Cp [ - ]'
# set output 'Cp.pdf'
# set ylabel "Cp" offset -1
# set xlabel "x/c"
# set grid
# set yrange [] reverse
# 
# plot [-0.01:1.01][]\
#   "origData/NASA.raw"  using 1:3 with linespoints ps 0.1 pt 6 lw 2 lc rgb "black" title 'NASA exp',\
#   "origData/NASA_SA.raw" with linespoints ps 0.1  pt 6lw 2 lc rgb "#777777" title 'NASA SA',\
#    "postProcessing/surfaces/5e-05/pMean_airfoilData.raw" using 1:($4/(0.5*900)) with linespoints ps 0.1  pt 6lw 2 lc rgb "red" title '(current model performance)'
