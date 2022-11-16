proc optex data=Candidate seed=12345;
    class Source;
    model Source Solvent|RTemp|Press|Time@2
          RTemp*RTemp Press*Press Time*Time;
 run;