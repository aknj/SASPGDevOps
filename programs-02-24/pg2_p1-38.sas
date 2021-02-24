data camping(drop=LodgingOther) lodging(drop=CampTotal);
	set pg2.np_2017;
	CampTotal = sum(of Camping:);
	format CampTotal comma10.;
	keep ParkName Month DayVisits CampTotal LodgingOther;

	if CampTotal > 0 then do;
		output camping;
	end;
	if LodgingOther > 0 then do;
		output lodging;
	end;
run;