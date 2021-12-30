drop table day2.input;
create table day2.input (obsid int generated always as identity, direction varchar(7) not null, amount int not null);
import from input of del insert into day2.input (direction, amount);

