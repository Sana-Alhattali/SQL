--create or alter procedure
/*create or Alter procedure read_product_procedure  --alter help to modify procedur without create it agin
@pCity as nvarchar (40) as
begin
declare @city_name nvarchar(40) = @pCity;
select * from Supplier where City= @city_name;
end
EXEC read_product_procedure 'new Orleans';
*/

--Write a prosedur that print product name and the price with a givin id:
create or Alter procedure product_procedure  
@id int, --input parameter
@PName as nvarchar (50)  output , @UPrice decimal (12,2) output as --output prameter (return value)
begin
select  @PName = ProductName, @UPrice = UnitPrice from Product where id = @id
end
begin
declare @name nvarchar (50);
declare @price decimal (12,2);
exec product_procedure 11, @name output, @price output;
print @name;
print @price;
end

create or Alter procedure Customer_procedure  
@id int = 10, --input parameter
@FName as nvarchar (40)  output, @LName as nvarchar (40)  output , @Phone as nvarchar (20)  output as --output prameter (return value)
begin
select  @FName = FirstName, @LName= LastName, @phone = Phone from Customer where id = @id
end

begin
declare @FirstName nvarchar (40);
declare @LastName nvarchar (40);
declare @CPhone nvarchar (20);
exec Customer_procedure default, @FirstName output, @LastName output, @CPhone output ; --using default value for id
print @FirstName;
print @LastName;
print @CPhone;
end

--procedur read number odd or even:
create or Alter procedure Read_number  
@num int ,
@result nvarchar (20) output as
begin
if @num % 2=0
print  'even';
else
print 'odd';
end
begin
--declare @n int;
declare @res nvarchar (20)
exec Read_number 7, @res output;
end


