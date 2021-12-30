with t(s) as ( 
	values '00100','11110','10110','10111','10101','01111','00111','11100','10000','11001','00010','01010' 
	-- select b from day3.t
), gen(n) as ( 
	values 0 
	union all 
	select n+1 from gen 
	where n<(select max(length(s))-1 from t) and n<100
), res(n,bitval,sig) as ( 
	select n, (power(2,max(length(s))-1-n)), sum(int(substr(s,n+1,1))) > count(1)/2 
	from t 
	cross join gen 
	group by n
) 
select n,bitval,sig 
from res

--from t 
--join (
--     select sum(bitval) as x, listagg(case when sig then 1 else 0 end) within group (order by n) as s
--     from res
--     group by bitval
--) x using (s)
--
-- group by n

;
