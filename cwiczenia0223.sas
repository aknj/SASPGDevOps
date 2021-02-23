data eu_occ_total;
	set pg1.eu_occ;
	/* konwersja z tekstu na liczbe funkcja input */
	Year = input(substr(YearMon, 1, 4), 4.);
	Month = input(substr(YearMon, 6, 2), 2.);
	ReportDay = mdy(Month, 1, Year);
	total = sum(hotel, shortstay, camp);
	format total hotel shortstay camp comma20.0 reportday monyy7.;
	keep country hotel ShortStay Camp reportday total;
run;


data np_summary;
	set pg1.np_summary;
	ParkType = scan(ParkName, -1);
	keep Reg Type ParkName ParkType;
run;