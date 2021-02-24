***********************************************************;
*  LESSON 4, PRACTICE 7                                   *;
*    a) Submit the program and view the generated output. *;
*    b) In the DATA step, use IF-THEN/ELSE statements to  *;
*       create a new column, ParkType, based on the value *;
*       of Type.                                          *;
*       NM -> Monument                                    *;
*       NP -> Park                                        *;
*       NPRE, PRE, or PRESERVE -> Preserve                *;
*       NS -> Seashore                                    *;
*       RVR or RIVERWAYS -> River                         *;
*    c) Modify the PROC FREQ step to generate a frequency *;
*       report for ParkType.                              *;
***********************************************************;

data park_type;
	set pg1.np_summary;
	*Add IF-THEN-ELSE statements;
	if Type = "NM" then do;
		ParkType = "Monument";
		end;
	else if Type = "NP" then do;
		ParkType = "Park";
		end;
	else if Type in ("NPRE", "PRE", "PRESERVE") then do;
		ParkType = "Preserve";
		end;
	else if Type = "NS" then do;
		ParkType = "Seashore";
		end;
	else if Type in ("RVR", "RIVERWAYS") then do;
		ParkType = "River";
		end;
run;

proc freq data=park_type;
	tables ParkType;
run;
