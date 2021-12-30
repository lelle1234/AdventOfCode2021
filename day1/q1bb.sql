 select sum(x) from (
	select obsid, sonar_depthx, sonar_depthx > lag(sonar_depthx) over (order by obsid) x 
	from (
		select obsid, case when count(1) over w = 3
				   then sum(sonar_depth) over w
			      end sonar_depthx 
		from day1.input
		window w as (order by obsid rows 2 preceding)
	)
)
;
