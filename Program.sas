data suv_upto_30000;
	set sashelp.cars;
	where type="SUV" and mrsp<=30000;
run;


/* uzycie formatow */
data class_bd;
	set pg1.class_birthdate;
	format Birthdate ddmmyyd10.;
	where Birthdate>="01sep2005"d;
run;


/* 3-52 */

/* 8. */
proc sort data=pg1.np_largeparks out=park_clean nodupkey dupout=park_dups;
	by _all_;
run;

/* 9. */
proc sort data=pg1.eu_occ(keep=geo country) out=country_list nodupkey;
	by Geo Country;
run;


/*  */
data cars_avg;
	format mpg_mean 5.2;
	set sashelp.cars;
	mpg_mean = mean(mpg_city, mpg_highway);
run;