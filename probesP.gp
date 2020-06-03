set title "Convergence process"
set xlabel "Iterations"
set ylabel "P at selected points"

set style line 1 lt 1 lw 2 lc rgb "#FF0000"
set style line 2 lt 1 lw 2 lc rgb "#00C000"
set style line 3 lt 1 lw 2 lc rgb "#0000FF"
set style line 4 lt 1 lw 2 lc rgb "#FF9C20"
set style line 5 lt 1 lw 2 lc rgb "#9400D3"


a= "< awk '/./{line=$0} END{print line}' postProcessing/probes/0/U | cut -d'(' -f2 | cut -d' ' -f1"

set mytics 10
set grid
set grid mytics


plot [ ] [-1500:500 ] "< grep '^ ' postProcessing/probes/0/p | awk '{print $2}' " with line ls 1 title 'x=0.65',\
 "<   grep '^ ' postProcessing/probes/0/p | awk '{print $3}' " with line ls 2 title 'x=0.65',\
 "<   grep '^ ' postProcessing/probes/0/p | awk '{print $4}' " with line ls 3 title  'x=0.05',\
 "<   grep '^ ' postProcessing/probes/0/p | awk '{print $5}' " with line ls 4 title 'x=1.02'

pause mouse
reread
