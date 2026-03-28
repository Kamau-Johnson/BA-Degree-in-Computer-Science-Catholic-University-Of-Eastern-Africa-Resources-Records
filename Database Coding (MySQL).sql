show databases;
create schema ordersdb;
create schema test1;
drop schema test1;
use ordersdb;
show tables;
#create customer table
create table customer
(
  custno int primary key not null,
  custname varchar(50) not null,
  email varchar(50) not null unique,
  mobileno int not null unique,
  country text not null,
  gender varchar(6) not null
);
show tables;
desc customer;
create table category
(
  catname varchar(50) primary key not null,
  descr text not null
);
show tables;
alter table customer add dob date not null;
describe customer;
alter table customer add address varchar(10)
after custno;
alter table customer drop address;
alter table customer drop primary key;
alter table customer add primary key(custno);
#select version();
use ordersdb;
describe customer;
alter table customer change dob dateofbirth date;

#SQL to change mobile datatype to varchar (20);
alter table customer modify mobileno varchar (20);
#add default value for gender 
alter table customer alter gender set default 'N/A';
show tables;

create table test
(
id int primary key not null
);
alter table test rename to tbltest;
drop table tbltest;
describe category;

create table products
(
prodcode int primary key not null,
prodname varchar (80) not null unique,
price decimal not null,
quantity bigint not null,
catname varchar (50) not null,
foreign key (catname) references category (catname)
);

describe products;
describe customer;

#SQL command to insert data
insert into customer(custno,custname,email,country,gender,dateofbirth,mobileno)
values(1,"Joe","joe@gmail.com", 'Kenya', 'Male','2023-12-25',34);
insert into customer(custno,custname,email,country,gender,dateofbirth,mobileno)
values(2,"John","john@gmail.com", 'UK', 'Male','1920-01-31',45);
insert into customer(custno,custname,email,country,gender,dateofbirth,mobileno)
values(3,"Jane","jane@gmail.com", 'US', 'Female','2020-02-14',80);
insert into customer(custno,custname,email,country,gender,dateofbirth,mobileno)
values(4,"Phil","phil@gmail.com", 'Kenya', 'Male','1800-10-10',54);
select * from customer;
#delete tuple for custno4
delete from customer where custno=4;

#update customer 1 name and email
update customer
set custname = 'peter', email = 'peter@gmail.com' where custno=1;
select * from customer;

#create orders table
create table orders
(
orderID int auto_increment primary key not null,
orderdate date not null,
quantity int not null,
custno int not null,
prodcode int not null,
foreign key(custno) references customer(custno),
foreign key(prodcode) references products(prodcode)
);

select distinct gender from customer;
select custno,year(curdate())-year(dateofbirth) as 'age'  from customer;

#sql to return first two records
select * from customer limit 1;


