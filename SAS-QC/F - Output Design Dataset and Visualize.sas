
%let nbr_of_runs=140;


proc optex data=Candidate seed=12345;
    class source;
    model source Solvent|RTemp|Press|Time@2
          RTemp*RTemp Press*Press Time*Time;
    generate n=&nbr_of_runs. ;
	output out= WORK.RUN_&nbr_of_runs. ;
 run;


ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=WORK.RUN_&nbr_of_runs.;
	vbar Source / response=RTemp fillattrs=(color=CX2470AD transparency=0.25) 
		datalabel limits=both limitstat=clm stat=mean;
	yaxis grid;
run;

ods graphics / reset;