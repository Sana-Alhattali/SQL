Create or Alter view EmpView as
select e.EmployeeId, e.firstname, e.salary, d.departmentName
from Employees e, Department d
where d.departmentid = e.DepartmentId;

create or alter trigger trig_empView on EmpView instead of insert as
begin
declare @empid int;
declare @name nvarchar (50);
declare @sal decimal(18,2);
declare @depid int;

select @empid = Employeeid, @name = FirstName, @sal = Salary, @depid  = d.Departmentid
from Department d, inserted
where d.departmentName = inserted.DepartmentName;

if @depid is null 
begin
print 'invalid Department';
ROLLBACK;
End
insert into Employees (EmployeeId, FirstName,Salary, DepartmentId)
values ( @empid, @name, @sal, @depid);
end

insert into EmpView values(12,'John',60000,'HR');
insert into EmpView values(11,'John',60000,null);
select * from EmpView;
select* from Employees;