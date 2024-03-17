                       1
--open company_sd db 
DECLARE @EmployeeID INT;
DECLARE @EmployeeName VARCHAR(255);
DECLARE @EmployeeSalary DECIMAL(10, 2);
DECLARE employee_cursor CURSOR FOR
SELECT ssn, fname +' '+lname "emplyee names", Salary
FROM Employee;
OPEN employee_cursor;
FETCH NEXT FROM employee_cursor INTO
@EmployeeID, @EmployeeName, @EmployeeSalary;
WHILE @@FETCH_STATUS = 0
BEGIN
    IF @EmployeeSalary < 3000
        SET @EmployeeSalary = @EmployeeSalary * 1.10;  -- Increase by 10%
    ELSE
	    SET @EmployeeSalary = @EmployeeSalary * 1.20;  -- Increase by 20%
UPDATE Employee
    SET Salary = @EmployeeSalary
    WHERE ssn = @EmployeeID;
FETCH NEXT FROM employee_cursor INTO @EmployeeID, @EmployeeName, @EmployeeSalary;
END
CLOSE employee_cursor;
DEALLOCATE employee_cursor
--open iti db
                                2
DECLARE @DepartmentName VARCHAR(255);
DECLARE @ManagerName VARCHAR(255);
DECLARE department_cursor CURSOR FOR
SELECT Dept_name, Dept_manager FROM Department d , Instructor i
where d.Dept_Manager=i.Ins_Id for read only
OPEN department_cursor;
FETCH NEXT FROM department_cursor INTO @ManagerName, @DepartmentName;
WHILE @@FETCH_STATUS = 0
BEGIN
 SELECT @ManagerName = Dept_manager
    FROM Department
    WHERE @DepartmentName = Dept_name;
select  @DepartmentName , @ManagerName
FETCH NEXT FROM department_cursor INTO @ManagerName, @DepartmentName ;
END
CLOSE department_cursor;
DEALLOCATE department_cursor
                                3
DECLARE @FirstName VARCHAR(MAX),@allnames varchar(max)
DECLARE student_cursor CURSOR FOR
SELECT st_fname FROM Student for read only
OPEN student_cursor;
FETCH NEXT FROM student_cursor INTO @FirstName;
WHILE @@FETCH_STATUS = 0
BEGIN
SET @allnames = concat(@allnames , ', ' ,@FirstName);
    SET @FirstName = @FirstName + @FirstName + ', '
    FETCH NEXT FROM student_cursor INTO @FirstName;
END
select @allnames
CLOSE student_cursor;
DEALLOCATE student_cursor;
--open adventureworks2012
select rowguid,name,SalesPersonID,Demographics into store_Archive
from sales.Store
select * from store_Archive
   11 lap(5)
