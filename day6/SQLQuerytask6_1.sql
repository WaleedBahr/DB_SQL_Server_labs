create table department (
deptno varchar(50) primary key,
deptname varchar (50),
location varchar (80)
);

create rule value_rule as @value in ('NY','DS','KW')
insert into department
values ('d1','Research','NY'),
('d2','Accounting','DS'),('d3','Markiting','KW')
sp_bindrule 'value_rule','department.location'

create table employee (
empno int primary key ,
deptno varchar(50) references department(deptno),
salary numeric(6,2) unique,
empfname varchar(50) not null,
emplast varchar (50) not null,
);
create rule salary_rule as @salary<6000
sp_bindrule 'salary_rule','employee.salary'

alter table works_on
add constraint wo_def default '11-26-2023' for enter_date
insert into works_on (empno) values (11111)
update works_on set empno=11111 where empno=10102
update employee set empno=22222 where empno=10102
delete from employee where empno=10102
alter table employee add telephone_num varchar(20)
alter table employee drop column telephone_num
create schema company_schema
alter schema company_schema transfer dbo.department
create Schema  Human_Resource
alter schema Human_Resource transfer dbo.employee
EXEC sp_help 'Human_Resource.employee'
select CONSTRAINT_NAME, CONSTRAINT_TYPE from
INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where table_name ='EMPLOYEE'
GRANT SELECT ON Human_Resource.employee TO emp
DROP SYNONYM emp
Create SYNONYM emp for Human_Resource.employee
EXEC sp_refreshview 'emp'
SELECT * FROM sys.synonyms WHERE name = 'emp'
select * from employee
Select * from Human_Resource.Employee
Select * from emp
Select * from Human_Resource.emp
update company_schema.project set budget=budget*1.1
from company_schema.project,works_on where
project_no=projectno and empno=10102
select * from company_schema.project
update company_schema.department set 
deptname='sales' from 
company_schema.department d,Human_Resource.Employee e where 
d.deptno=e.deptno and e.empfname='James' 
select * from company_schema.department
update works_on set enter_date='12.12.2007'
from works_on w,Human_Resource.Employee e,
company_schema.department d
where   e.empno=w.empno and d.deptno=e.deptno 
and projectno='p1' and deptname='sales'
select * from works_on
delete from works_on where empno in (select empno from 
Human_Resource.Employee e,company_schema.department d 
where d.deptno=e.deptno and location='KW')
select * from works_on