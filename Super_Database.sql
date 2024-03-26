Create Database Supermarket;
use Supermarket;
CREATE TABLE Customer(
c_id int PRIMARY KEY,
c_name varchar(255),
c_phone varchar(20)
);
CREATE TABLE Employee (
e_ID int PRIMARY KEY,
e_name varchar(255),
e_phone varchar(20)
);
CREATE TABLE Product (
p_id int PRIMARY KEY,
p_name varchar(255),
p_price int,
p_decs varchar(255)
);
CREATE TABLE Transactionn (
t_id int PRIMARY KEY,
t_date date,
t_total int
);
CREATE TABLE Transaction_Employee_Customer (
quantity int
);
create table Employeeposition( e_position varchar(20));
alter table Employeeposition add column e_id int;
alter table Employeeposition add foreign key (e_id) references Employee(e_id);
insert into Customer values(1001,"priya",777766);
insert into Customer values(1002, "sita", 4455667);
insert into Customer values(1003, "ram", 456477);
insert into Customer values(1004, "satya", 784397);
select * from Customer ;
insert into Employee values(2001, "suresh", 3454);
insert into Employee values(2002, "satish", 3421);
insert into Employee values(2003, "ramya", 3456);
insert into Employee values(2004, "niha", 3422);
select * from Employee;
insert into Product values(0001, "atta", 45, "nutritious");
insert into Product values(0002, "soap", 35, "paraben-free");
insert into Product values(0003, "shampoo", 45, "sulphate-free");
insert into Product values(0004, "dairy-milk", 20, "tasty");
select * from Product;
insert into Transactionn values(4001, '2023-08-12', 300,1001,2001);
insert into Transactionn values(4002,'2021-07-14', 100,1002,2002);
insert into Transactionn values(4003,'2021-02-15', 120,1003,2003);
insert into Transactionn values(4004, '22-06-12', 50,1004,2004);
select * from Transactionn;
alter table Transactionn add column (c_id int ,e_id int);
alter table Transactionn add  FOREIGN KEY (c_id) REFERENCES Customer(c_id);
alter table Transactionn add  foreign key (e_id) references Employee(e_id);
insert into Transaction_Employee_Customer values(30,2001,1001,0001);
insert into Transaction_Employee_Customer values(35,2002,1002,0002);
insert into Transaction_Employee_Customer values(40,2003,1003,0003);
insert into Transaction_Employee_Customer values(45,2004,1004,0004);
alter table Transaction_Employee_Customer add column (e_id int,c_id int); 
alter table Transaction_Employee_Customer add column p_id int;
alter table Transaction_Employee_Customer add  FOREIGN KEY (e_id) REFERENCES Employee(e_id);
alter table Transaction_Employee_Customer add  FOREIGN KEY (c_id) REFERENCES Customer(c_id);
alter table Transaction_Employee_Customer add  FOREIGN KEY (p_id) REFERENCES Product(p_id);

insert into Employeeposition values("manager",2001);
insert into Employeeposition values("salesman",2002);
insert into Employeeposition values("salesman",2003);
insert into Employeeposition values("cashier",2004);
select * from Transaction_Employee_Customer;
select * from Employeeposition;
-- Query 1
select c_name from Customer where c_id = 1002;
-- Query 2
select t_id from Transactionn where c_id = 1001;
-- Query 3
select e_name from Employee where e_phone = 3454;
-- Query 4
select e_id from Transactionn where e_id = (select e_id from Employee where e_name = 'niha');
-- Query 5
select c_id from Transactionn where c_id = (select c_id from Customer where c_name = 'sita' ); 
-- Query 6
select * from Transaction_Employee_Customer where p_id = (select p_id from Product where p_name = 'shampoo');
-- Query 7
select * from Product order by p_price ;
-- Query 8
select p_decs  from Product  where p_name = 'atta';
-- Query 9
select e_id from Employeeposition where e_position = 'salesman';
-- Query 10 
select quantity,p_id from Transaction_Employee_Customer where quantity > 30;
-- Query 11
select Transaction_Employee_Customer.e_id , Transactionn.e_id from  Transactionn left join Transaction_Employee_Customer on Transaction_Employee_Customer.e_id = Transactionn.e_id;
-- Query 12
select Transactionn.c_id , Customer.c_id from Transactionn right join Customer on Transactionn.c_id = Customer.c_id;
-- Query 13
select Product.p_id , Transaction_Employee_Customer.p_id from Product inner join  Transaction_Employee_Customer on Product.p_id = Transaction_Employee_Customer.p_id;





