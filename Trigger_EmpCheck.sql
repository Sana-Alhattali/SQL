create or alter trigger EmpSalCkeck on Employees for delete as
begin
declare @count int ;
select @count = count(*) From deleted;
if @count>1
begin
print'cannot delete more than one record at a time';
ROLLBACK;
end
end
DELETE FROM Employees WHERE EmployeeId = 9;
DELETE FROM Employees;
