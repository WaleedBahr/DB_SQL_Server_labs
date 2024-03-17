                     1
select dname,dnum,fname "manager name" ,ssn from Employee,Departments
where ssn=MGRSSN
                     2
select dname,pname from Project p , Departments d 
where d.Dnum=p.Dnum
                     3 
select Dependent_name,fname,lname,d.sex,d.bdate
from Dependent d , Employee e
where e.SSN=d.ESSN
                     4
select pname,plocation,city,dnum from Project
where city ='alex' or city='cairo'
                     5
select * from Project where pname like 'a%'
                     6
select fname +' '+lname "employee name" , salary from Employee
where Dno=30 and Salary between 1000 and 2000
                     7
select fname +' '+lname "employee name" , hours,pname
from Employee e  , Project p ,Works_for w 
where dno=10 and w.ESSn=e.SSN and p.Pnumber=w.Pno
and Hours >= 10 and Pname ='AL Rabwah'
                  8
select e.fname +' '+e.lname "employee name" ,
s.fname +' '+s.lname "suprvisor name"
from Employee e  , Employee s
where s.SSN = e.Superssn and s.Fname='Kamel' and s.Lname='Mohamed'

                  9
select fname +' '+lname "employee name" , pname
from Employee e  , Project p ,Works_for w 
where  w.ESSn=e.SSN and p.Pnumber=w.Pno order by pname asc
                  10
select pnumber , dname , lname , address , bdate
from Employee e,Departments d ,Project p 
where e.SSN=d.MGRSSN and d.Dnum= p.Dnum and city = 'cairo'
                          11

select * from Employee e , Departments d 
where e.SSN=d.MGRSSN
                          12

select * from Employee e left join Dependent d
on e.SSN = d.ESSN
                   13
insert into Employee  (dno,ssn,superssn,salary)
values(30,102672,112233,3000)
                   14
insert into Employee  (dno,ssn)
values(30,102660)

                   15
update Employee set Salary=Salary*1.2
where ssn=102660