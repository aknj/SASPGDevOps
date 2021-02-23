data eu_occ_total;
	set pg1.eu_occ;
	Year = substr(YearMon, 1, 4);
	Month = substr(YearMon, 6, 2);
	ReportDay = mdy(Month, 1, Year);
	total = sum(hotel, shortstay, camp);
	format total hotel shortstay camp nlnum20.0 reportday monyy7.;
	keep country hotel ShortStay Camp reportday total;
run;


data np_summary;
	set pg1.np_summary;
	ParkType = scan(ParkName, -1);
	keep Reg Type ParkName ParkType;
run;