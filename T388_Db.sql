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

drop table Employeee;

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

use T388_db;
select * from employeee
where department ="It" or department ="finance";

select * from employeee
where department in ("It","finance");


use T388_db;
create table Kisan_info (
ID int unique not null,
name varchar(50) unique not null,
age int check (age>=18),
email_Id varchar(40) default "dummy@gmail.com"
);

insert into kisan_info
values
(104,"vignesh",22,default);

alter table kisan_info modify age int check (age>=15);
select * from kisan_info;
desc kisan_info;

select distinct department from employeee;

-- ORDER CLAUSE
use T388_db;
select * from employeee order by department desc;
select * from employeee where gender ="male" order by fullname;

-- W G H O
-- WHERE ,GROUP BY -[HAVING],ORDER BY

select * from employeee limit 5;

-- GROUP BY -[HAVING]
select department from employeee group by department;
select department,count(EmployeeeId) from employeee group by department;
select gender,count(EmployeeeId) from employeee group by gender;
select department,sum(salary) from employeee group by department;
select department,avg(salary) from employeee group by department;
select department,avg(salary), sum(salary) from employeee group by department;

select department,avg(salary) as Avg_salary, sum(salary) as Total_salary from employeee group by department;
 
-- HAVING CLAUSE(along with GROUP CLAUSE)
select department,count(*) from employeee group by department having sum(salary) >150000;
select department,count(*) from employeee group by department having avg(age) >27;
select department,avg(age),count(*) from employeee group by department having sum(salary) >150000;
  
  -- shows current date
select now();

  
  CREATE TABLE Projects (

ProjectId INT PRIMARY KEY AUTO_INCREMENT,
ProjectName VARCHAR(200) NOT NULL,
EmployeeId INT,
StartDate DATETIME,
EndDate DATETIME
);


INSERT INTO Projects VALUES

(1,'Develop Ecommerse Website from
scratch', 1003, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),

(2,'WordPress Website for our company',
1002, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),

(3,'Manage our Company Servers', 1007,
NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),

(4,'Hosting account is not working', 1009,
NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),

(5,'MySQL database from my desktop
application', 1010, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),


(6,'Develop new WordPress plugin for my business
website', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY)),

(7,'Migrate web application and database to
new server', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY)),

(8,'Android Application development', 1004,
NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),

(9,'Hosting account is not working', 1001,
NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),

(10,'MySQL database from my desktop
application', 1008, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),

(11,'Develop new WordPress plugin for my
business website', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY));


select * from projects;
select *,datediff(enddate, startdate) as Duration from projects;

select *,datediff(enddate, startdate) as Duration from projects
where datediff(enddate, startdate) = 45;

ALTER TABLE Projects
ADD Duration int ;
select * from projects;
update projects set duration = datediff(enddate,startdate);

select duration,count(*) from projects group by duration;
select duration,count(*) from projects group by duration having count(*)>=2;

select duration,count(*) from projects 
where duration>=20
group by duration 
having count(*)>=2
order by duration desc limit 2;

select * from employeee limit 3,5;
select distinct department from employeee;
select distinct gender from employeee;
select distinct age from employeee;
select * from projects;
select * from projects where employeeid is not  null;

 update projects set employeeid = 1003 where projectid =6;
 

-- IN , Between and LIKE
select * from employeee where age between 25 and 28;

-- (IN operator)
select * from employeee where employeeeid in ( 1003,1005,1006);

-- (alternative for in operator)
select * from employeee where employeeeid = 1003
or employeeeid = 1004
or employeeeid = 1005;


-- (AND Operator)
select * from employeee where
age in (23,28)
and department ="IT"
and employeeeid IN (1008,1001);
select * from employeee;

select * from simple where fullname like "a%";
select * from simple where fullname like "_u%";
select * from simple where fullname like "%t%";
select * from simple where fullname like "a_%";
select * from simple where fullname like "a%t";
select * from simple where fullname Not like "a%t";

-- Aggregrate function 
select avg(salary) from employeee;
select sum(salary) from employeee;
select max(salary) from employeee;
select min(salary) from employeee;
select count(*) as Total_EMP ,
avg(salary) as Average,
sum(salary) as Total_Salary from employeee;


-- Math Function 
select abs(300-800);
select abs(6*(-7));
select (6*(-7));

select abs(datediff(startdate,enddate))
as duration from projects;

-- Divide
select mod(12,7); 

-- celing and floor function 
select ceil(33.8);
select floor(33.8);

-- truncate function
select truncate(12456.8765432,3);
select truncate(12456.8765432,0);
select truncate(12456.8765432,-2);  


-- Exponential function  
select exp(2);

-- power Function
select power(2,4);

-- SQRT function
select sqrt(169);
select *,sqrt(salary) from employeee; -- give the square root of perticular value



--   STRING()
select concat("good"," ","morning") as remarks; -- it will combine two words or given function

select *,concat(fullname,"-",department)as code from employeee;

select *,lower(fullname) as newname, upper(fullname) as CAPITALNAME from employeee;-- it will give the value in form of  small and captial 

-- doing concat in employeee table
alter table employeee modify EMAIL varchar(50);
update employeee set EMAIL =concat(fullname,"@gmail.com");
select * from employeee;

-- REPLACE FUNC
select replace("hello everyone,good morning","morning","night" ) as statement;
select fullname,replace(fullname,"Jones","patil") as changed from employeee;

-- REVERSE FUNC
select fullname,
reverse(fullname)
from employeee; -- it will reverse the name eg uday-yadu

-- LENGTH FUNC
select fullname,length(fullname)
from employeee;-- it will give the legth of the character eg uday-4

-- SUBSTRING FUN
select substring("Maharashrta",1,3);

-- TRIM FUN
select FULLNAME,length(FULLNAME) as actual_length,
ltrim(FULLNAME) as lefttrim,length(ltrim(FULLNAME)) as LTRIM_Length,
rtrim(FULLNAME) as righttrim,length(rtrim(FULLNAME)) as RTRIM_Length,
trim(FULLNAME) as Both_sides_Trim,length(trim(FULLNAME)) as ALL_TRIM_Length from trimmer;

-- SUB QUERIES
select * from employeee;
select age from employeee where employeeeid =1002;

select * from employeee
where age=(select age from employeee where fullname="Mary Smith");

select * from employeee
where salary=(select salary from employeee where fullname="John Doe");

select * from employeee
where department=(select department from employeee where fullname="John Doe");

select max(salary) from employeee;

select max(salary) from employeee 
where salary <(select max(salary) from employeee);

