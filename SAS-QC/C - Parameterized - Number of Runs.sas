
%let nbr_of_runs=25;


proc optex data=Candidate seed=12345;
    class source;
    model source Solvent|RTemp|Press|Time@2
          RTemp*RTemp Press*Press Time*Time;
    generate n=&nbr_of_runs.;
 run;