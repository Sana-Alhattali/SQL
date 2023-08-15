
Select * from Customer;
Select * from "order";
Select * from product;
select * from supplier;
select * from OrderItem; 


select OrderNumber "order no" from "Order";
select OrderNumber Order_2 from "Order"; --As word is optional as Order_2
select distinct city from customer;
Select * from "order";
select distinct customerid  from "order";
select Top 5 * from "order";
select Top 5 id, firstname from customer;
select * from "order" where totalAmount > 800;
select * from customer where id > any (select id from customer where id between 2 and 4);

select unitprice from product where unitprice = 18 or unitprice = 20 or unitprice = 22; -- where unitprice in(18,20,22)

select min(orderdate) from "order";
select avg(totalamount) as average from "order" ;
select count(id) from customer;
select firstname from Customer  order by firstname ASC; --order from a-z
select firstname from Customer  order by firstname DESC; -- order from z-a
select count(id) from "order" where Customerid =2;
select count(customerid) as "count",firstname from "order", customer where "order".customerid = customer.id group by firstname;
select count(customerid) as "count",firstname from "order", customer where "order".customerid = customer.id and "order".orderdate < '2013-01-01' group by firstname;
select count(customerid) as "count",firstname from "order", customer where "order".customerid = customer.id and "order".orderdate < '2013-01-01' 
group by firstname having  count(customerid)>5 order by firstname desc;

select top 6 max(totalamount) totalprice ,firstname, lastname 
from "order", customer 
where "order".customerid = customer.id 
group by firstname,lastname
order by totalprice desc;

select companyname ,avg(unitprice) as average from supplier ,product 
where product.supplierid = supplier.id
group by CompanyName;

select  country, count(companyname)  as count_company from supplier
group by country;

select sum(totalamount) as total from "order";

select  max(quantity) highest ,firstname, lastname  from OrderItem oi , product p, customer c, "order" o
where oi.ProductId = p.Id and oi.orderid = o.id and  o.CustomerId=c.Id
group by firstname,lastname
order by  highest Desc;

select * from customer where firstname like '_o%';
select * from customer where firstname like 'a%';
select * from customer where firstname like '%o%';
select * from customer where firstname like '%o';

select * from customer where  country in ('UK', 'Mexico');
select * from customer where phone like '%555%';

select firstname + LASTname "student name" from customer;

select convert (varchar(10), getdate());




