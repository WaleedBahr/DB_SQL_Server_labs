                    1
create view  couseview as
select st_fname +' '+st_lname "fullname",crs_name
from Student s,Course c,Stud_Course w where s.St_Id=w.St_Id
and w.Crs_Id=c.Crs_Id and w.Grade>50
select * from couseview
                     2
create view v2 with Encrypted as
(select d.dept_manager,t.top_name from Department d,Instructor i,
Ins_Course ic,Course c,Topic t where i.Ins_Id=d.Dept_Manager and
i.Ins_Id=ic.Ins_Id and c.Crs_Id=ic.Crs_Id and t.Top_Id=c.Top_Id)
                     3
CREATE VIEW InstructorDepatView AS
select ins_name,dept_name from Department d,Instructor i
where d.Dept_Id=i.Dept_Id and Dept_Name in ('java' , 'SD')
select * from  InstructorDepatView

                      4
create view v1 as 
select * from Student where 
St_Address in ('alex','cairo')WITH CHECK OPTION;
select * from v1
Update V1 set st_address='tanta' Where st_address='alex'

                       5
Create view vw_SelectProjectNumber as
Select  Pname,count(essn) as ANumberOfEmployees 
from Project p , Works_for w where p.Pnumber = w.Pno
group by pname
Select * from vw_SelectProjectNumber

                        6

Create NONCLUSTERED index index_Hiredate 
on Department(Manager_hiredate) 

                        7
create unique index un_index_age on student (st_age) --error Because there are duplicate values

                        8
create table dailytransaction(
UserID int, 
TransactionAmount int
);
create table lasttransaction(
UserID int, 
TransactionAmount int
);
insert into dailytransaction values
(1,1000),(2,2002),(3,1000)
insert into lasttransaction values
(1,4000),(4,2000),(2,10000)
MERGE INTO [dbo].[dailytransaction] t
USING [dbo].[lasttransaction] s
ON t.[UserID] = s.[UserID]
WHEN MATCHED THEN
    UPDATE SET t.[TransactionAmount] = s.[TransactionAmount]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([UserID], [TransactionAmount])
	VALUES (s.[UserID],s.[TransactionAmount]);
	select * from dailytransaction
	select * from lasttransaction
