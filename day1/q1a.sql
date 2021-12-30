select sum(x) from (select sonar_depth > lag(sonar_depth) over (order by obsid) x from day1.input);
