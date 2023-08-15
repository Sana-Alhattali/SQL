--scal Fuction
--create function which return the area of circle:
create or alter function dbo.circle_area (@p_radius numeric(10,2))
returns numeric(8,2)
as
begin 
declare @v_ip numeric(8,2) = pi();
declare @v_area numeric(8,2);
set @v_area = @v_ip * POWER(@v_ip,2);
return @v_area;
end;
--calling function
select dbo.circle_area(4) as area;

--calling function inside variable:
declare @result numeric (8,2);
set @result = dbo.circle_area(4);
print 'the area of circle : ' + cast(@result as varchar);


--create function that concat first name and last name and taken id as parameter:
create or alter function dbo.create_name (@id int)
returns  nvarchar(40) as
begin 
declare @fName nvarchar(20);
declare @lName nvarchar(20);
declare @fullname nvarchar(80);
select @fName = FirstName, @lName = LastName from Customer where id=@id;
set @fullname = @fName+ ' '+ @lName;
return @fullname;
end;

select dbo.create_name(10) as "name";

--Table_valued Function
create or alter function GetCustomer (@country nvarchar(50))
returns table
as
return
select Id, FirstName,LastName,City from Customer where Country = @country;

select * from dbo.GetCustomer('USA');


--create table-valued function that return list of product in a specific company:
create or alter function GetProduct (@CompanyID int)
returns table as
return
select P.Id, ProductName, CompanyName from Product P, Supplier S where P.SupplierId = S.Id and S.Id = @CompanyID;

select * from dbo.GetProduct(2);

--Exercise
create or alter function Customer_totaAmount (@year datetime)
returns table as
return
select  year(OrderDate) as "Year", C.Id, FirstName, LastName,sum(TotalAmount) as TotalAmount  from Customer C, "Order" O
where O.CustomerId = C.Id and year(OrderDate)=@year
group by C.Id, FirstName, LastName, year(OrderDate);

select * from dbo.Customer_totaAmount(2012);






