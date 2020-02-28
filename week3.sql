show databases;
use db_1bm18cs048;
create table Supplier
( sid int,
sname varchar(30),
city varchar(30),
primary key(sid));
create table Parts
(pid int,
pname varchar(30),
color varchar(30),
primary key(pid));
create table catalog(
cost int,
sid int,
pid int,
foreign key(sid) references supplier(sid) on delete cascade,
foreign key(pid) references Parts(pid) on delete cascade,
primary key(sid,pid));

insert into supplier 
values(10001,"Acme Widget","Bangalore");
insert into supplier 
values(10002,"Johns","Kolkatta");
insert into supplier 
values(10003,"Vimal","Mumbai");
insert into supplier 
values(10004,"Reliance","Delhi");

insert into parts
values(20001,"Book","Red");
insert into parts
values(20002,"pen","Red");
insert into parts
values(20003,"pencil","Green");
insert into parts
values(20004,"Mobile","Green");
insert into parts
values(20005,"Charger","Black");

insert into catalog
values(10,10001,20001);
insert into catalog
values(10,10001,20002);
insert into catalog
values(30,10001,20003);
insert into catalog
values(10,10001,20004);
insert into catalog
values(10,10001,20005);
insert into catalog
values(10,10002,20001);
insert into catalog
values(20,10002,20002);
insert into catalog
values(30,10003,20003);
insert into catalog
values(40,10004,20003);

select distinct(supplier.sid) from supplier,catalog,parts
where supplier.sid=catalog.sid and parts.pid=catalog.pid and parts.color in('red','green');

select distinct(supplier.sid) from supplier,catalog,parts
where supplier.sid=catalog.sid and parts.pid=catalog.pid and parts.color in('red') or supplier.city='Bangalore';


select s1.sid,s2.sid,p1.pid from supplier s1,supplier s2,catalog c1,catalog c2,parts p1
where s1.sid=c1.sid and s2.sid=c2.sid and p1.pid=c1.pid and p1.pid=c2.pid and c1.cost>c2.cost; 



