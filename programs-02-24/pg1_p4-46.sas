data parks monuments;
	set pg1.np_summary;
	where Type in ("NP", "NM");
	Campers = sum(TentCampers, RVCampers, BackcountryCampers, OtherCamping);
	format Campers comma.;
	if Type = "NP" then do;
		ParkType = "Park";
		output parks;
	end;
	else if Type = "NM" then do;
		ParkType = "Monument";
		output monuments;
	end;
	keep Reg ParkName DayVisits OtherLodging Campers ParkType;
run;


data parks monuments;
	set pg1.np_summary;
	Campers = sum(TentCampers, RVCampers, BackcountryCampers, OtherCamping);
	format Campers comma.;
	select (Type);
		when ("NP") do;
			ParkType = "Park";
			output parks;
		end;
		when ("NM") do;
			ParkType = "Monument";
			output monuments;
		end;
/*		otherwise;*/
	end;
	keep Reg ParkName DayVisits OtherLodging Campers ParkType;
	where Type in ("NP", "NM");
run;