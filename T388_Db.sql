select 3*4 as multiplication;
select 14/7 as Quotient;
select 14%5 as Remender;
select 26>6 as Compare;
select database();
-- Logical Operators --
select  3<4 or 23>45 as or_result;
select not 45>67;
select 4<5 and 45>67 as and_result;


create database T388_db;
use T388_db;
show databases;
CREATE TABLE Employeee (
  EmployeeeId INT PRIMARY KEY,
  FullName VARCHAR(45) NOT NULL,
  Department VARCHAR(45) NOT NULL,
  Salary float NOT NULL,
  Gender VARCHAR(45) NOT NULL,
  Age INT NOT NULL
);


select * from Employeee;
insert into Employeee values
(1001,"John Doe","IT",35000,"Male",25), 
(1002, 'Mary Smith', 'HR', 45000, 'Female', 27), 
(1003, 'James Brown', 'Finance', 50000, 'Male', 28), 
(1004, 'Mike Walker', 'Finance', 50000, 'Male', 28),
(1005, 'Linda Jones', 'HR', 75000, 'Female', 26), 
(1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25), 
(1007, 'Priyanka Dewangan', 'HR', 45000, 'Female', 27), 
(1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28), 
(1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28), 
(1010, 'Hina Sharma', 'HR', 75000, 'Female', 26);

delete from employeee where Gender="MALE";
delete from employeee where Age >25;

alter table employeee
ADD Location varchar(10);

alter table employeee
add bonus float after salary;

alter table employeee
add title varchar(5) first;

alter table employeee modify fullname varchar(35);

alter table Employeee 
change column Location address varchar(36);

update Employeee Set Address ="THANE"; 
alter table employeee drop address,drop title,drop bonus;

update  employeee set address="Dombavli"
where department="IT";

update  employeee set Title="Mrs"
where gender="female";

update  employeee set Title="Mr"
where gender="male";

update Employeee set bonus=salary*0.05; 
desc Employeee; -- (This is for comment)
