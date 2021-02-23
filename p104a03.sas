***********************************************************;
*  Activity 4.03                                          *;
*    1) Change the name of the output table to            *;
*       STORM_CAT5.                                       *;
*    2) Include only Category 5 storms (MaxWindMPH        *;
*       greater than or equal to 156) with StartDate on   *;
*       or after 01JAN2000.                               *;
*    3) Add a statement to include the following columns  *;
*       in the output data: Season, Basin, Name, Type,    *;
*       and MaxWindMPH. How many Category 5 storms        *;
*       occurred since January 1, 2000?                   *;
***********************************************************;

* if necessary, change the path to your output folder *;
/*libname out "s:/workshop/output";*/

data storm_CAT5(drop=date);
    set pg1.storm_summary(keep=season basin name type maxwindmph startdate);
	where MaxWindMPH>=156 and StartDate>="01jan2000"d;
run;
