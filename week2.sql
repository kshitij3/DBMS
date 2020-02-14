create table BRANCH(
branch_name varchar(30),
branch_city varchar(30),
assets REAL,
primary key(branch_name));

create table ACCOUNTS(
accno int,
branch_name varchar(30),
balance REAL,
primary key(accno),
foreign key(branch_name)references branch(branch_name));

create table bank_customer(
customer_name varchar(30),
customer_street varchar(30),
customer_city varchar(30),
primary key(customer_name));

create table DEPOSITOR(
customer_name varchar(30),
accno int,
primary key(accno,customer_name),
foreign key(accno)references accounts(accno),
foreign key(customer_name)references bank_customer(customer_name));

create table LOAN(
loan_number int,
branch_name varchar(30),
amount REAL,
primary key(loan_number),
foreign key(branch_name)references branch(branch_name));

insert into branch
values("SBI_Chamrajpet","Bangalore",50000);
insert into branch
values("SBI_Residencyroad","Bangalore",10000);
insert into branch
values("SBI_Shivajiroad","Bombay",20000);
insert into branch
values("SBI_Parlimentroad","Delhi",10000);
insert into branch
values("SBI_Jantarmantar","Delhi",20000);

insert into accounts
values(1,"SBI_Chamrajpet",2000);
insert into accounts
values(2,"SBI_Residencyroad",5000);
insert into accounts
values(3,"SBI_Shivajiroad",6000);
insert into accounts
values(4,"SBI_Parlimentroad",9000);
insert into accounts
values(5,"SBI_Jantarmantar",8000);
insert into accounts
values(6,"SBI_Shivajiroad",4000);
insert into accounts
values(8,"SBI_Residencyroad",4000);
insert into accounts
values(9,"SBI_Parlimentroad",3000);
insert into accounts
values(10,"SBI_Residencyroad",5000);
insert into accounts
values(11,"SBI_Jantarmantar",2000);

insert into bank_customer
values("Avinash","Bull_Temple_road","Bangalore");
insert into bank_customer
values("Dinesh","Bannerghatta_road","Bangalore");
insert into bank_customer
values("Mohan","Nationalcollege_road","Bangalore");
insert into bank_customer
values("Nikil","Akbar_road","Delhi");
insert into bank_customer
values("Ravi","Prithviraj_road","Delhi");

insert into loan
values(1,"SBI_Chamrajpet",1000);
insert into loan
values(2,"SBI_Residencyroad",2000);
insert into loan
values(3,"SBI_Shivajiroad",3000);
insert into loan
values(4,"SBI_Parlimentroad",4000);
insert into loan
values(5,"SBI_Jantarmantar",5000);

insert into depositor
values("Avinash",1);
insert into depositor
values("Dinesh",2);
insert into depositor
values("Nikil",4);
insert into depositor
values("Ravi",5);
insert into depositor
values("Avinash",8);
insert into depositor
values("Nikil",9);
insert into depositor
values("Dinesh",10);
insert into depositor
values("Nikil",11);

select * from Branch;
select * from accounts;
select * from bank_customer;
select * from depositor;
select * from loan;
