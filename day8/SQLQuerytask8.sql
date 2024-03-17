              1
CREATE PROC NUM_OF_ST AS
  SELECT COUNT(*) , Dept_Id
  FROM Student
  GROUP BY Dept_Id
  exec NUM_OF_ST
              2
CREATE PROC num_of_emp (@proj_name VARCHAR(20)) AS
 Begin
 DECLARE @num INT =( SELECT COUNT(*) FROM Employee E, Works_for W ,Project P
 where  E.SSN = W.ESSn and P.Pnumber = W.Pno and P.Pname = @proj_name)
 IF @num >= 3
   SELECT 'The number of employees in the project '+ @proj_name +' is 3 or more'
 ELSE   
   SELECT 'The following employees work for the project '+@proj_name + Fname ,Lname 
   FROM Employee
  End
  exec num_of_emp 'Al Rehab'
                       3
CREATE PROC REPLACE (@old_emp_num INT,@new_emp_num INT,@prpj_mum INT) AS 
BEGIN
   UPDATE Works_for
   SET ESSn = @new_emp_num
   WHERE ESSn = @old_emp_num and Pno = @prpj_mum
END
EXEC REPLACE 223344,101022,100 
                        4
CREATE TABLE AUDIT(
ProjectNo int ,
UserName Varchar(20),
ModifiedDate datetime,
old_dnum int,
new_dnum int
)
CREATE TRIGGER t4 ON Project AFTER UPDATE AS
BEGIN
   INSERT INTO AUDIT (ProjectNO, UserName, ModifiedDate, Old_dnum, New_dnum)
   SELECT i.Pnumber, SUSER_NAME(), GETDATE(), d.dnum AS old_dnum, i.dnum AS new_dnum
   FROM inserted i ,deleted d where i.Pnumber = d.Pnumber 
END;
UPDATE Project set Dnum=50 where pnumber=100

                              5
CREATE TRIGGER t5 ON Department instead of Insert AS
BEGIN
   select 'You can’t insert a new record in that table' from inserted
END;
INSERT INTO Department(Dept_Id) VALUES(100)
                               6
CREATE TRIGGER t6 ON Employee instead of Insert AS
BEGIN
  IF MONTH(GETDATE()) = 3
     select 'you can not insert into employee table in march'
END;
insert into Employee values ('walid','bahr',7777,03-03-1998,'minia','m',5000,null,null)
                                   7

 CREATE TABLE ST_AUDIT(
SERVER_UserName Varchar(20),
DATEE datetime,
NOTE VARCHAR(60)
)
CREATE TRIGGER t6 ON Student AFTER Insert AS
BEGIN
   INSERT INTO ST_AUDIT
   VALUES(SUSER_NAME(),GETDATE(), SUSER_NAME()+' Insert New Row with Key= '+ 
   (SELECT ST_ID FROM inserted) +' in table Student')
END;
INSERT INTO Student (ST_ID) VALUES (15)
7--
CREATE TABLE StudentAudit
(
	ServerUserName varchar(50),
	AuditDate Date,
	Note varchar(100)
)

CREATE TRIGGER AuditInsertStudent ON Student AFTER INSERT AS
DECLARE @keyInserted int
SELECT @keyInserted = St_Id FROM inserted
INSERT INTO StudentAudit
VALUES (SUSER_NAME(), GETDATE(), CONCAT(SUSER_NAME(), 
' Insert New Row with Key=', @keyInserted, ' in table Student'))
INSERT INTO Student(St_Id) VALUES (400)

                   8
CREATE TRIGGER t8 ON Student Instead of delete AS

BEGIN
   INSERT INTO ST_AUDIT
   VALUES(SUSER_NAME(),GETDATE(),  SUSER_NAME()+
   ' try to delete Row with Key= '+ (SELECT ST_ID FROM inserted))
END;
delete from Student where ST_ID=14



