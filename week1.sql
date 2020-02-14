show databases;
create database db_1BM18CS048;
use db_1BM18CS048;

create table person( 
driver_id varchar(30),
Name varchar(30),
Address varchar(30)
,primary key(driver_id));

create table Car( 
reg_num varchar(30),
model varchar(30),
year int,
primary key(reg_num));

create table Accident( 
report_num int,
accident_date date,
Location varchar(30),
primary key(report_num));

create table owns( 
driver_id varchar(30),
reg_num varchar(30),
primary key(driver_id,reg_num),
foreign key(driver_id)references person(driver_id),
foreign key(reg_num)references Car(reg_num));

create table participated( 
driver_id varchar(30),
reg_num varchar(30),
report_num int,
damage_amount int,
primary key(driver_id,reg_num,report_num),
foreign key(driver_id)references person(driver_id),
foreign key(reg_num)references Car(reg_num),
foreign key(report_num)references accident(report_num));

insert into Person
values("A01","Richard","Srinivas nagar");

insert into Person
values("A02","Pradeep","Rajajinagar");

insert into Person
values("A03","Smith","Ashok nagar");

insert into Person
values("A04","Verma","N R Colony");

insert into Person
values("A05","Jhon","Hanumanth nagar");


insert into Car
values("KA052250","Indica",1990);
insert into Car
values("KA031181","Lancer",1957);
insert into Car
values("KA095477","Toyata",1998);
insert into Car
values("KA053048","Honda",2008);
insert into Car
values("KA041702","Audi",2005);

insert into Owns
values("A01","KA052250");
insert into Owns
values("A02","KA031181");
insert into Owns
values("A03","KA095477");
insert into Owns
values("A04","KA053048");
insert into Owns
values("A05","KA041702");


insert into accident
values(11,'2003-01-01',"Mysore road");
insert into accident
values(12,'2004-02-02',"South end circle");
insert into accident
values(13,'2003-01-21',"Bull temple road");
insert into accident
values(14,'2008-02-08',"Mysore road");
insert into accident
values(15,'2005-03-05',"Kanakapura road");

insert into participated
values("A01","KA052250",11,10000);
insert into participated
values("A02","KA053048",12,50000);
insert into participated
values("A03","KA095477",13,25000);
insert into participated
values("A04","KA031181",14,3000);
insert into participated
values("A05","KA041702",15,5000);

select * from person;
select * from car;

update participated 
set damage_amount=25000
where reg_num ='KA053408'
and
report_num=12;
 select * from person;
insert into accident
values(18,'10/10/10','MG ROAD');
select * from accident;
select count(distinct driver_id) cnt
from participated, accident
where participated.report_num=accident.report_num 
and accident_date like '%2008%';                                          




