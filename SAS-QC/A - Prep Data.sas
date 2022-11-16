/* New Reaction Process */

/* If I wish to create a candidate dataset */

proc plan ordered;
    factors RTemp=3 Press=3 Time=3 Solvent=2 Source=5 / noprint;
    output out=Candidate
       RTemp   nvals=(150 to 350 by 100)
       Press   nvals=( 10 to  30 by  10)
       Time    nvals=(  3 to   5       )
       Solvent nvals=( 20 to  25 by   5)
       Source  nvals=(  1 to   5       );
 data Candidate; set Candidate;
    if (^((RTemp = 150) & (Press = 10) & (Time = 3)));
    if (^((RTemp = 350) & (Press = 30) & (Time = 5)));
 run;
 proc print data=Candidate(obs=10);
 run;
 