--curser
Begin
declare @customerId int;
declare @fname nvarchar(40);
declare @city nvarchar(40);

declare v_customer_cursor cursor for 
select ID, FirstName, city from Customer where Country = 'uk';
open v_customer_cursor 
fetch next from v_customer_cursor into @customerId ,@fname,@city;
while @@FETCH_STATUS = 0
begin
print 'Customer : ' + cast(@customerId as varchar) + ' => ' + @fname + 'from '+ @city;
fetch next from v_customer_cursor into @customerId ,@fname,@city;
end
close v_customer_cursor;
deallocate v_customer_cursor;
End

begin
declare @dis int;
declare @Upri int;
declare @Cname varchar(40);
declare v_product_cursor cursor for 
select Discontinued, UnitPrice, CompanyName from Products P, Suppliers S
where P.SupplierID = S.SupplierID and Discontinued=1
open v_product_cursor 
fetch next from v_product_cursor into @dis , @Upri, @Cname;
while @@FETCH_STATUS = 0

begin
print 'discount: ' +cast(@dis as varchar) +'  Unit Price: ' + cast(@Upri as varchar)+' ' + 'Company Name : '+ @Cname
fetch next from v_product_cursor into @dis ,@Upri,@Cname;
end
close v_product_cursor;
deallocate v_product_cursor;
End

begin
declare @fax varchar(24);
declare fax_cursor cursor for 
select fax from Suppliers where country = 'UK';
open fax_cursor 
fetch next from fax_cursor into @fax
while @@FETCH_STATUS = 0
begin
set @fax = 'not found';
update Suppliers set fax = @fax where Country = 'UK';
print  @fax ;
fetch next from fax_cursor into @fax
end
close fax_cursor;
deallocate fax_cursor;
End


select * from Suppliers


