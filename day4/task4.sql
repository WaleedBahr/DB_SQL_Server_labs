

                       1
select 	d.Dependent_name,d.sex from Employee e , Dependent d
where e.SSN=d.ESSN and d.sex='f' and e.Sex='f'
union
select 	d.Dependent_name,d.sex from Employee e , Dependent d
where e.SSN=d.ESSN and d.sex='m' and e.Sex='m'

                       2
select pname ,count(hours) as "total hours per week "
from Project,Works_for 
where Pnumber=Pno
group by pname

                       3 
select * from Departments where Dnum in 
(select min(ssn) from Employee)

                       4
select d.dname ,MAX(e.salary) "max_salary",
MIN(e.Salary) "min_salary",AVG(e.Salary) "avg_salary"
from Departments d ,Employee e where e.SSN=d.MGRSSN
group by d.dname

                       5

select e.fname +' '+e.lname "employee name" from
Employee e , Departments d
where e.SSN=d.MGRSSN
except
select e.fname +' '+e.lname "employee name" from
Employee e , Departments d ,Dependent w
where e.SSN=d.MGRSSN and e.SSN=w.ESSN

                          6
select d.dname,d.dnum ,count(e.ssn) "num_employees"
from Employee e ,Departments d
where e.SSN=d.MGRSSN group by d.Dname,d.Dnum
Having AVG(e.Salary)<(select avg(Salary) from Employee)

                            7

select e.fname +' '+e.lname "employee name" , p.pname
from Employee e , Project p , Works_for w
where e.SSN=w.ESSn and w.Pno=p.Pnumber
order by e.Fname,e.Lname,e.Dno

                            8
select max(salary) from employee
union
select max(salary) from Employee
where Salary not in (select max(salary) from Employee)

							9
select distinct e.fname +' '+e.lname "employee name"  from Employee e
intersect 
select Dependent_name from Dependent
                            10
select e.fname +' '+e.lname "employee name" ,ssn"employee number"
from Employee e 
where exists (select * from Dependent where e.ssn=essn )
  

                            11
insert into Departments (Dname,Dnum,MGRSSN,[MGRStart Date])
values('DEPT IT',100,112233,'1-11-2006')
                       12
update Departments set MGRSSN=968574 where Dnum=100
update Departments set MGRSSN=02672 where Dnum=20
update Employee set Superssn=102660  where ssn=102672
                        13
delete Dependent where essn=223344
delete Works_for where essn=223344
update Departments set MGRSSN=102672 where MGRSSN=223344
update employee set Superssn=102660 where Superssn=223344
delete employee where ssn=223344
                         15

update Employee set salary = (salary *1.3)
from Employee ,Works_for,Project
where ssn=essn and pno=Pnumber and pname='Al Rabwah'