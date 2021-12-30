--with t(s) as ( 
--	values '00100','11110','10110','10111','10101','01111','00111','11100','10000','11001','00010','01010' 
--	select b from day3.t
--)
--, res(bitval,sig) as ( 
--	select power(2, 4-n) as bitval
--        select power(2, 11-n) as bitval
--	     , int(sum(int(substr(s,n+1,1))) > count(1)/2) as sig
--	from t 
--	cross join ( values 0,1,2,3,4 ) gen(n)
--	  cross join ( values 0,1,2,3,4,5,6,7,8,9,10,11 ) gen(n)
--
--	group by n
--) 
select sum(sig*bitval) -- gamma
     * (sum(bitval)-sum(sig*bitval)) 
--	sum(mod(sig+1,2)*bitval) -- epsilon
from (
	select power(2, 11-n) as bitval
	     , int(sum(int(substr(b,n+1,1))) > count(1)/2) as sig
        from day3.t	
        cross join ( values 0,1,2,3,4,5,6,7,8,9,10,11 ) gen(n)
	group by n
)
;
