***********************************************************;
*  Using Date Functions                                   *;
***********************************************************;
*  Syntax                                                 *;
*                                                         *;
*  Date function examples:                                *;
*    YEAR (SAS-date)                                      *;
*    MONTH (SAS-date)                                     *;
*    DAY (SAS-date)                                       *;
*    WEEKDAY (SAS-date)                                   *;
*    TODAY ()                                             *;
*    MDY (month, day, year)                               *;
*    YRDIF (startdate, enddate, 'AGE')                    *;
***********************************************************;

***********************************************************;
*  Demo                                                   *;
*    1) Create the column YearsPassed and use the YRDIF   *;
*       function. The difference in years should be based *;
*       on each Date value and today's date.              *;
*    2) Create Anniversary as the day and month of each   *;
*       storm in the current year.                        *;
*    3) Format YearsPassed to round the value to one      *;
*       decimal place, and Date and Anniversary as        *;
*       MM/DD/YYYY. Highlight the DATA step and run the   *;
*       selected code.                                    *;
***********************************************************;

data storm_new;
	set pg1.storm_damage;
	drop Summary;
	*Add assignment and FORMAT statements;
	YearsPassed = yrdif(Date, today());
	format YearsPassed nlnum6.1 Date Anniversary mmddyy10.;
	Anniversary = mdy(month(date), day(date), year(today()));
run;


data np_summary_update;
	set pg1.np_summary;
	SqMiles = Acres * 0.0015625;
	Camping = sum(tentCampers, otherCamping, rvcampers, backcountrycampers);
	format camping sqmiles comma15.0;
	keep reg parkname DayVisits OtherLodging Acres sqmiles camping;
run;
