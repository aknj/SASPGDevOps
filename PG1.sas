/* wyrazenia warunkowe */

data cars_categories;
	set sashelp.cars;
	length car_category $12;
	if MSRP <= 30000 then do;
		cost_category = 1;
		car_category = "Basic";
		end;
	else if MSRP <= 60000 then do;
		cost_category = 2;
		car_category = "Luxury";
		end;
	else do;
		cost_category = 3;
		car_category = "Extra luxury";
		end;
run;

data Basic Luxury Extra_luxury;
	set sashelp.cars;
	length car_category $12;
	if MSRP <= 30000 then do;
		cost_category = 1;
		car_category = "Basic";
		output Basic;
		end;
	else if MSRP <= 60000 then do;
		cost_category = 2;
		car_category = "Luxury";
		output Luxury;
		end;
	else do;
		cost_category = 3;
		car_category = "Extra luxury";
		output Extra_luxury;
		end;
run;


/* zlaczenia danych w sql */
proc sql;
	create table class_grades as
	select ct.name, sex, age, teacher, grade
	from pg1.class_teachers as ct inner join pg1.class_update as cu
	on ct.name = cu.name;
quit;

proc sql;
	select coalesce(t.name, c.name) as name, sex, age, teacher, grade
	from pg1.class_teachers as t full join pg1.class_update as c
	on t.name = c.name;
quit;