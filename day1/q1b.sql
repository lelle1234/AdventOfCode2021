 select sum(x) from (
	select obsid, sonar_depthx, sonar_depthx > lag(sonar_depthx) over (order by obsid) x 
	from (
		select obsid, case when count(1) over (order by obsid rows 2 preceding) = 3
				   then sum(sonar_depth) over (order by obsid rows 2 preceding)
			      end sonar_depthx 
		from day1.input
	)
--	where obsid between 199 and 209
)
;
