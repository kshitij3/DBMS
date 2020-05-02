create database Airline;
use Airline;
create table flights(flno int, ffrom varchar(15), fto varchar(15), distance int, departs timestamp default '2005-05-13 17:15:31', arrives timestamp default '2005-05-13 17:15:31', price int, primary key (flno));
create table aircraft(aid int, aname varchar(15), cruisingrange int, primary key (aid));
create table employees(eid int, ename varchar(15), salary int, primary key (eid));
create table certified(eid int, aid int, primary key (eid,aid), foreign key(eid) references employees(eid), foreign key(aid) references aircraft(aid));
insert into flights values
(101,'Bangalore','Delhi',2500,'2005-05-13 07:15:31','2005-05-13 17:15:31',5000),
(102,'Bangalore','Lucknow',3000,'2005-05-13 07:15:31','2005-05-13 11:15:31',6000),
(103,'Lucknow','Delhi',500,'2005-05-13 12:15:31',' 2005-05-13 17:15:31',3000),
(107,'Bangalore','Frankfurt',8000,'2005-05-13 07:15:31','2005-05-13 22:15:31',60000),
(104,'Bangalore','Frankfurt',8500,'2005-05-13 07:15:31','2005-05-13 23:15:31',75000),
(105,'Kolkata','Delhi',3400,'2005-05-13 07:15:31','2005-05-13 09:15:31',7000);
insert into aircraft values
(101,'747',3000),
(102,'Boeing',900),
(103,'647',800),
(104,'Dreamliner',10000),
(105,'Boeing',3500),
(106,'707',1500),
(107,'Dream', 120000);
insert into employees values
(701,'A',50000),
(702,'B',100000),
(703,'C',150000),
(704,'D',90000),
(705,'E',40000),
(706,'F',60000),
(707,'G',90000);
insert into certified values
(701,101),
(701,102),
(701,106),
(701,105),
(702,104),
(703,104),
(704,104),
(702,107),
(703,107),
(704,107),
(702,101),
(703,105),
(704,105),
(705,103);

select * from flights;
select * from aircraft;
select * from certified;
select * from employees;

select distinct aname 
from aircraft a,employees e,certified c
		where a.aid=c.aid and e.eid=c.eid and e.salary>80000;

select c.eid, max(a.cruisingrange)
from certified c, aircraft a
		where c.aid=a.aid
		group by c.eid
				having count(*)>3;

select ename
from employees
		where salary<(select min(price)
				from flights
                where ffrom='Bangalore' and fto='Frankfurt');
                
select a.aname, avg(e.salary)
from aircraft a, employees e, certified c
		where a.aid=c.aid and a.cruisingrange>1000 and e.eid=c.eid
				group by a.aname;
                                                        
select distinct e.ename
from employees e,certified c, aircraft a
		where a.aid=c.aid and e.eid=c.eid and a.aname='Boeing';

select a.aid
from aircraft a
		where a.cruisingrange >( select min(f.distance)
					from flights f
					where f.ffrom = 'Bangalore' AND f.fto = 'Delhi' );

select F.departs
from Flights F
		where F.flno in (( select F0.flno
 							from Flights F0
 									WHERE F0.ffrom = 'Bangalore' AND F0.fto = 'Delhi'
 									AND extract(hour from F0.arrives) < 18 )
 									UNION
									( SELECT F0.flno
 										FROM Flights F0, Flights F1
 										WHERE F0.ffrom = 'Bangalore' AND F0.fto <> 'Delhi'
										AND F0.fto = F1.ffrom AND F1.fto = 'Delhi'
 										AND F1.departs > F0.arrives
 										AND extract(hour from F1.arrives) < 18)
 										UNION
										( SELECT F0.flno
 											FROM Flights F0, Flights F1, Flights F2
												 WHERE F0.ffrom = 'Bangalore'
 												 AND F0.fto = F1.ffrom
												 AND F1.fto = F2.ffrom
												 AND F2.fto = 'Delhi'
												 AND F0.fto <> 'Delhi'
												 AND F1.fto <> 'Delhi'
												 AND F1.departs > F0.arrives
												 AND F2.departs > F1.arrives
 												 AND extract(hour from F2.arrives) < 18));
 
SELECT E.ename, E.salary
FROM Employees E
		WHERE E.eid NOT IN ( SELECT DISTINCT C.eid
 		FROM Certified C )
		AND E.salary >( SELECT AVG (E1.salary)
 		FROM Employees E1
 				WHERE E1.eid IN
				( SELECT DISTINCT C1.eid
 					FROM Certified C1 ) ); 