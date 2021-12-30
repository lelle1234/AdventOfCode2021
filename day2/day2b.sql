select sum(h) * sum(d) 
from (
    select obsid, direction, amount, h
	 , case direction when 'forward' 
           then amount * sum(w) over (order by obsid) 
           else 0 end d
    from (
	select obsid, direction, amount
	     , case direction when 'forward' then amount else 0 end h
	     , case direction when 'up' then -1 when 'down' then 1 else 0 end * amount w
	from day2.input 
    )
);

