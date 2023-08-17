Create or Alter view OrderView as
select o.OrderDate, c.firstname, c.lastname, o.OrderNumber
from customer c, "order" o
where o.CustomerId= c.Id;

create or alter trigger trig_orderView on OrderView instead of insert as
begin
declare @custid int;
declare @ordernum nvarchar (10); --column that inserted
declare @ordedate datetime ;
declare @orderid int;

select @ordernum = OrderNumber,@ordedate = OrderDate, @custid = c.Id
from Customer c,  inserted
where c.FirstName= inserted.FirstName and c.LastName = inserted.LastName;

if @custid is null 
begin
print 'invalid customer';
ROLLBACK;
End
insert into "Order" (OrderDate, OrderNumber,CustomerId)
values ( @ordedate,  @ordernum, @custid);
end

insert into OrderView values('2013-02-01','Matti','Karttunen','542468');
select * from OrderView
select * from "Order";