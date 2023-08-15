begin
    declare @var numeric(5);
	declare @var1 varchar (10) ;
	set @var = 2;
	set @var1 = 'Ali';
	print @var;
	print @var1;
	
	print @var1 + ' '+ cast(@var as nvarchar);
end

Begin
	declare @width numeric(5);
	declare @hieght numeric(5);
	declare @area numeric(5);

	set @width = 5;
	set @hieght = 4;
	set @area = 5*4;

	print 'the area is: '+ cast(@area as nvarchar);
End

Begin
 declare @firstName nvarchar(20);
 declare @country nvarchar(15);

 select @firstName = FirstName, @country= Country
 from Employees
 where EmployeeID = 1

print @firstName + ' ' + @country;
End
--print the average of all product
begin
declare @avg numeric(5,2);
select @avg = avg(UnitPrice) 
from Products;
print'The average of product: ' + cast( @avg as nvarchar);
end

--using if-else statment
begin
declare @price numeric(12,2);
select @price = unitPrice from Products
where ProductID = 10
if @price >=100
   print 'product is expensive';
else 
   print 'product is not expensive'; end
--*****************************************************

begin
declare @Uprice numeric(12,2);
declare @Pname nvarchar (40);
set @Uprice = 30;
if @Uprice >=50
   select * from Products where  UnitPrice>=50;
else 
   select * from Products where  UnitPrice<50;
end

--*****************************************************
begin
select CompanyName, Country =
case Country
     when 'UK' then 'United Kingdom'
	 when 'USA' then 'United State'
else country
end 
from Suppliers;
end
--*********************************************
begin
select CompanyName , fax =
case 
    when fax is null then 'not found'
else fax
end
from Suppliers;
end


begin
select ProductID , discontinued =
case discontinued 
    when '0' then 'no'
else 'Yes'	

end
from Products;
end
--*************************************
--using while loop:
begin
declare @uniprice numeric(12,2);
declare @id int = 30;
while @id<=40
begin
select @uniprice = unitPrice from Products
where ProductID=@id
if @uniprice >=100
   print 'product is expensive';
else 
   print 'product is not expensive';
set @id = @id +1;
    end
 end

begin
declare @min int = 1;
declare @max int = 10;
while @min <= @max
begin

if @min % 3 = 0
begin
set @min = @min + 1;
  continue;
end
 print @min
set @min =@min+1;
 end
end

--Exception Handling

Begin try 
  select 1/0
end try
begin catch
select
@@ERROR as error,
ERROR_MESSAGE() as ErrorMessage;
end catch


Begin try  
declare @avg1 numeric(5,2);
select @avg1 = avg(UnitPrice) 
from Products;
print'The average of product: ' +  @avg1 ;
end try
begin catch
select
@@ERROR as error,
ERROR_MESSAGE() as ErrorMessage;
end catch








select* from customers






