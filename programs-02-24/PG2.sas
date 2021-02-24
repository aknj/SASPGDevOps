data storm_summary;
	set pg2.storm_summary;
	duration = enddate-startdate;
run;





data quiz;
	set pg2.class_quiz;
	putlog "NOTE: przed rutyna"
	putlog _all_;
	call sortn(of Q:);
	putlog "NOTE: po rutynie"
	putlog _all_;

	if mean(of q:) < 7 then
		call missing(of _all_);
run;


data quiz;
	set pg2.class_quiz;
	quiz1st = largest(1, of quiz1-quiz5);
	quiz2st = largest(2, of quiz1-quiz5);
	studentId = rand(
run;