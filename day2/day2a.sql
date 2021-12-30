select x*y from (
	select obsid, direction, amount
	     , sum(case direction when 'forward' then amount else 0 end) over (order by obsid) x
	     , sum(case direction when 'up' then -1 when 'down' then 1 else 0 end * amount) over (order by obsid) y 
	from day2.input 
	order by obsid desc fetch first 1 rows only
);

