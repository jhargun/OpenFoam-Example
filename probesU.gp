set title "Convergence process"
set xlabel "Iterations"
set ylabel "Ux at selected points"

set style line 1 lt 1 lw 2 lc rgb "#FF0000"
set style line 2 lt 1 lw 2 lc rgb "#00C000"
set style line 3 lt 1 lw 2 lc rgb "#0000FF"
set style line 4 lt 1 lw 2 lc rgb "#FF9C20"
set style line 5 lt 1 lw 2 lc rgb "#9400D3"

set mytics 10
set grid
set grid mytics


plot [ ] [ -30:70] "< grep '(' postProcessing/probes/0/U | cut -d'(' -f2 | cut -d' ' -f1 " with line ls 1  title 'Ux, x=0.65',\
 "<   grep '(' postProcessing/probes/0/U | cut -d'(' -f3 | cut -d' ' -f1 " with line ls 2   title 'Ux, x=0.65',\
 "<   grep '(' postProcessing/probes/0/U | cut -d'(' -f4 | cut -d' ' -f1 " with line ls 3   title  'Ux, x=0.05',\
 "<   grep '(' postProcessing/probes/0/U | cut -d'(' -f5 | cut -d' ' -f1 " with line ls 4   title 'Ux, x=1.02',\
 "<   grep '(' postProcessing/probesAveraged/1/UMean | cut -d'(' -f2 | cut -d' ' -f1 " with line ls 1 lw 5  title 'Ux Averaged, x=0.65',\
 "<   grep '(' postProcessing/probesAveraged/1/UMean | cut -d'(' -f3 | cut -d' ' -f1 " with line ls 2 lw 5    title 'Ux Averaged, x=0.65',\
 "<   grep '(' postProcessing/probesAveraged/1/UMean | cut -d'(' -f4 | cut -d' ' -f1 " with line ls 3 lw 5    title  'Ux Averaged, x=0.05',\
 "<   grep '(' postProcessing/probesAveraged/1/UMean | cut -d'(' -f5 | cut -d' ' -f1 " with line ls 4 lw 5    title 'Ux Averaged, x=1.02'

pause mouse
reread
