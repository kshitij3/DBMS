create database SUPPLIERS;
use SUPPLIERS;
create table Supplier(sid int,sname varchar(20),city varchar(20),PRIMARY KEY(sid));
create table Parts(pid int,pname varchar(20),color varchar(20),PRIMARY KEY(pid));
create table Catalog(sid int,pid int,cost double,PRIMARY KEY(sid,pid),foreign key(sid) references Supplier(sid),foreign key(pid) references Parts(pid));
insert into Supplier
Values (10001,'Acme Widget','Bangalore'),
(10002,'Johns','Kolkata'),
(10003,'Vimal','Mumbai'),
(10004,'Reliance','Delhi');
insert into Parts
Values (20001,'Book','Red'),
(20002,'Pen','Red'),
(20003,'Pencil','Green'),
(20004,'Mobile','Green'),
(20005,'Charger','Black');
insert into Catalog
Values (10001,20001,10),
(10001,20002,10),
(10001,20003,10),
(10001,20004,30),
(10001,20005,10),
(10002,20001,10),
(10002,20002,10),
(10003,20003,20),
(10004,20003,40);
select * from Supplier; 
select * from Parts; 
select * from Catalog; 

SELECT DISTINCT P.pname FROM Parts P, Catalog C WHERE P.pid = C.pid;

SELECT S.sname FROM Supplier S 
WHERE NOT EXISTS ((SELECT P.pid  FROM Parts P) 
					except (SELECT C.pid FROM Catalog C 
							WHERE C.sid = S.sid));

SELECT S.sname
FROM SUPPLIER S
WHERE NOT EXISTS (( SELECT P.pid
FROM Parts P
WHERE P.color = 'Red' )
			except
			( SELECT C.pid
			FROM Catalog C, Parts P
			WHERE C.sid = S.sid AND
			C.pid = P.pid AND P.color = 'Red' ));

SELECT DISTINCT C.sid FROM Catalog C 
			WHERE C.cost > ( SELECT AVG (C1.cost) 
							FROM Catalog C1 WHERE C1.pid = C.pid );

SELECT P.pid, S.sname 
FROM Parts P, Supplier S, Catalog C 
 			WHERE C.pid = P.pid AND C.sid = S.sid AND C.cost = 
						(SELECT MAX(C1.cost)FROM Catalog C1 WHERE C1.pid = P.pid);