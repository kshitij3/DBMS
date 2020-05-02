create database INSURANCE;
use INSURANCE;
create table PERSON(driver_id varchar(10),name varchar(20), address varchar(30),PRIMARY KEY(driver_id));
create table CAR(reg_num varchar(10),model varchar(20),year int, PRIMARY KEY(reg_num));
create table ACCIDENT(report_num int,accident_date date,location varchar(20), PRIMARY KEY(report_num));
create table OWNS(driver_id varchar(10),reg_num varchar(10), PRIMARY KEY(driver_id,reg_num), FOREIGN KEY(driver_id) REFERENCES PERSON(driver_id), FOREIGN KEY(reg_num) REFERENCES CAR(reg_num));
create table PARTICIPATED(driver_id varchar(10),reg_num varchar(10),report_num int, PRIMARY KEY(driver_id,reg_num,report_num), FOREIGN KEY(driver_id) REFERENCES PERSON(driver_id),FOREIGN KEY(reg_num) REFERENCES CAR(reg_num),FOREIGN KEY(report_num) REFERENCES ACCIDENT(report_num));
ALTER TABLE PARTICIPATED add(damage_amount int);
desc PARTICIPATED;
INSERT INTO PERSON      
values ('A01','Richard','Srinivas Nagar' ),('A02','Pradeep','Rajaji nagar'),('A03','Smith','Ashok Nagar'),('A04','Venu','N R Colony'),('A05','Jhon','Hanumanth Nagar');
INSERT into CAR
values('KA052250','Indica',1990),('KA031181','Lancer',1957),('KA095477','Toyota',1998),('KA053408','Honda',2008),('KA041702','Audi',2005);
insert into OWNS
values('A01','KA052250'),
('A02','KA053408'),
('A03','KA031181'),
('A04','KA095477'),
('A05','KA041702');
INSERT INTO ACCIDENT
values (11,'03/01/01','Mysore Road'),
(12,'04/02/02','Mysore Road'),
(13,'03/01/21','Mysore Road'),
(14,'08/02/17','Mysore Road'),
(15,'05/03/04','Mysore Road');
update ACCIDENT set location='South end Circle' where report_num=11;
update ACCIDENT set location='Bull Temple Road' where report_num=13;
update ACCIDENT set location='Kanakpura Road' where report_num=15;
select * from ACCIDENT;
insert into PARTICIPATED
values ('A01','KA052250',11,10000),
('A02','KA053408',12,50000),
('A03','KA095477',13,25000),
('A04','KA031181',14,3000),
('A05','KA041702',15,5000);
SELECT * FROM PARTICIPATED;
update PARTICIPATED 	
set damage_amount=25000 where reg_num='KA053408' and report_num=12;
insert into ACCIDENT values(16,'05/07/21','Malleshwaram');
select count(distinct driver_id) CNT from PARTICIPATED,ACCIDENT where  PARTICIPATED.report_num=ACCIDENT.report_num and accident_date like '2008%'; 	
select count(driver_id) COUNT  from PARTICIPATED,CAR where PARTICIPATED.reg_num=CAR.reg_num and model='Indica';
select distinct name 
from PERSON,PARTICIPATED
where damage_amount > (select avg(damage_amount)
						from PARTICIPATED);