/*1. Retrieve all columns from the "Customers" table:*/
--write your query here (3 points)
select * from customers;


/*2. Retrieve the "ProductName" column from the "Products" table:*/
--write your query here (3 points)
select ProductName from products;

/*3. Retrieve the "OrderID" and "OrderDate" columns from the "Orders" table,
ordered by "OrderDate" in descending order:*/
--write your query here (3 points)
select OrderID, Orderdate from orders order by OrderDate desc;

/*4. Retrieve the "CompanyName" column from the "Suppliers" table, 
where the "Country" is "USA":*/
--write your query here (3 points)
select companyName from Suppliers where Country = 'USA';

/*5. Retrieve the "CategoryName" column from the "Categories" table, 
ordered by "CategoryName" in alphabetical order:*/
--write your query here (3 points)
select CategoryName from Categories order by CategoryName Asc;


/*6. Retrieve the "CompanyName" and "ShipCity" columns from the "Shippers" table, joining it with the Orders
table to obtain the Shipper's city for each order*/
--write your query here (3 points)
select CompanyName, ShipCity from  Shippers Sh, orders O
where O.ShipVia= Sh.ShipperID ;

/*7. Retrieve the "FirstName" and "LastName" columns from the "Employees" table, 
where the "Country" is not "USA":*/
--write your query here (3 points)
select FirstName, LastName from Employees where Country != 'USA';


/*8. Retrieve the "CustomerID" and "CompanyName" columns from the "Customers" table, 
where the "City" is either "London" or "Paris":*/
--write your query here (3 points)
select CustomerID, CompanyName from Customers where city='London' or City='Paris';

/*9. Retrieve the "OrderID" and "ProductName" columns from the "Order Details" table, 
where the "Quantity" is greater than 10:*/
--write your query here (3 points)
select OrderID, ProductName from [Order Details], Products
where [Order Details].ProductID = products.ProductID and (Quantity>10);

/*10. Retrieve the "EmployeeID" and "Title" columns from the "Employees" table, 
where the "Title" contains the word "Manager":*/
--write your query here (3 points)
select EmployeeID, Title from Employees where Title like '%Manager%';


/*11. Retrieve the "SupplierID" and "CompanyName" columns from the "Suppliers" table, 
where the "CompanyName" starts with the letter "A":*/
--write your query here (6 points)
select SupplierID, CompanyName from Suppliers where CompanyName like 'A%';

/*12. Retrieve the "ProductID" and "UnitPrice" columns from the "Products" table, 
where the "UnitPrice" is between 10 and 20:*/
--write your query here (6 points)
select ProductID, UnitPrice from Products where UnitPrice between 10 and 20;

/*13. Retrieve the "ShipCountry" and the count of orders shipped to each country from the "Orders" table, 
grouped by "ShipCountry":*/
--write your query here (6 points)
select ShipCountry, count(OrderID) "count of orders shipped" from orders group by ShipCountry;

/*14. Retrieve the "CustomerID" and the sum of "Quantity" from the "Order Details" table, grouped by "CustomerID", 
ordered by the sum in descending order:*/
--write your query here (6 points)
select CustomerID, sum(Quantity) as "sum" from [Order Details] OD, Orders O 
where OD.OrderID = O.OrderID
group by CustomerID
order by "sum" desc;



/*15. Retrieve the "ProductName" and the average of "UnitPrice" from the "Products" table, grouped by "ProductName", 
ordered by the average in descending order:*/
--write your query here (6 points)
select ProductName,AVG(UnitPrice) as average from Products
group by ProductName 
order by average desc;


/*16. Retrieve the "OrderID" and "OrderDate" columns from the "Orders" table, 
where the "OrderDate" is in the year 1997 and the "ShipCity" is "Berlin":*/
--write your query here (6 points)
select OrderID, OrderDate from Orders where year(OrderDate)=1997  and ShipCity like'%Berlin%';


/*17. Retrieve the "CustomerID" and the minimum "OrderDate" from the "Orders" table, 
grouped by "CustomerID":*/
--write your query here (6 points)
select CustomerID, min(OrderDate) minDate from Orders  group by CustomerID;

/*18. Retrieve the "OrderID" and the maximum "RequiredDate" from the "Orders" table, 
where the "ShipCountry" is either "France" or "Spain":*/
--write your query here (6 points)
select OrderID, max(RequiredDate) as "maximum RequiredDate" from Orders 
where ShipCountry in ('France', 'Spain')
group by OrderID;

/*19. Retrieve the "ProductID" and the sum of "Quantity" from the "Order Details" table, grouped by "ProductID", 
where the sum is greater than 100:*/
--write your query here (6 points)
select ProductID, sum(Quantity) "sum of quantity" from [Order Details] 
group by ProductID
having sum(Quantity)>100;

/*20. Retrieve the "EmployeeID" and the count of orders handled by each employee from the "Employees" table, 
grouped by "EmployeeID", ordered by the count in descending order:*/
--write your query here (9 points)
select E.EmployeeID , count(OrderId ) as "count" from Employees E, Orders O where O.EmployeeID = E.EmployeeID
group by E.EmployeeID order by "count" DESC; 



/*21. Retrieve the customer ID, company name, and total revenue for customers who have made at least 5 orders, 
ordered by total revenue in descending order.*/
--write your query here (9 points)
select C.customerID, CompanyName, sum(Quantity*UnitPrice) TotalRevenue from Customers C, [Order Details] OD, Orders O
where OD.OrderID = O.OrderID and O.CustomerID = C.CustomerID and (Quantity>=5)
group by C.customerID, CompanyName
order by TotalRevenue DESC;


/*22. Retrieve the employee ID, first name, last name, and the number of orders they have taken, 
for employees who have taken orders in the year 1996, ordered by the number of orders in descending order.*/
--write your query here (9 points)
select E.EmployeeID,firstName, lastName, count(OrderID) NumberofOrder from Employees E, Orders O 
where O.EmployeeID = E.EmployeeID and year(O.OrderDate) = 1996
group by E.EmployeeID, firstName, LastName
order by NumberofOrder DESC;
 
/*23. Retrieve the product name, unit price, and the number of times each product has been ordered, 
for products that have been ordered more than 100 times, ordered by the number of times ordered in descending order.*/
--write your query here (9 points)
select ProductName , P.UnitPrice ,sum(Quantity) sumofProduct from Products P, [Order Details] OD
where OD.ProductID= p.ProductID
group by ProductName , P.UnitPrice
having sum(p.productID)>100
order by sumofProduct DESC;

/*24. Retrieve the employee ID, first name, last name, and the total revenue generated from the orders they have taken, 
for employees who have generated revenue exceeding $100,000, ordered by total revenue in descending order.*/
--write your query here (9 points)
select E.EmployeeID, FirstName, LastName, sum(OD.UnitPrice * OD.Quantity) TotalRevenue from Employees E, Orders O, [Order Details] OD
where O.EmployeeID = E.EmployeeID and O.OrderID = Od.OrderID 
group by E.EmployeeID, FirstName, LastName
having sum(OD.UnitPrice * OD.Quantity)>100000
order by  TotalRevenue DESC;


/*25. Retrieve the customer ID, company name, and the number of distinct products they have ordered, 
for customers who have ordered products from more than 5 different categories, 
ordered by the number of distinct products in descending order.*/
--write your query here (9 points)
select C.CustomerID, CompanyName ,count(distinct P.ProductId) distinctproducts 
from Customers C, Products P,Orders O, [Order Details] OD, Categories Ca
where O.CustomerID = C.CustomerID and O.OrderID=OD.OrderID and OD.ProductID = P.ProductID and p.CategoryID = Ca.CategoryID
group by C.CustomerID, CompanyName
having count(distinct Ca.CategoryID) > 5
order by distinctproducts DESC;

/*26. Retrieve the employee ID, first name, last name, and the number of orders they have taken, 
for employees who have taken orders in the month of February, sorted by the number of orders in descending order.*/
--write your query here (9 points)
select E.EmployeeID, FirstName, LastName, count(orderId) NumofOrder from Employees E, Orders O
where O.EmployeeID = E.EmployeeID and MONTH(OrderDate) =2
group by E.EmployeeID, FirstName, LastName
order by NumofOrder Desc;

/*27. Retrieve the product ID, product name, and the total revenue generated from the sales of each product, 
for products that have generated revenue exceeding the average revenue of all products,
ordered by total revenue in descending order.*/
--write your query here (9 points)
select P.ProductID, ProductName, sum(quantity* OD.unitPrice) TotalRevneue from Products P, [Order Details] OD
where OD.ProductID= p.ProductID
group by P.ProductID, ProductName
having sum(quantity* OD.unitPrice)>( select avg(TotalRevneue) from 
( select ProductID, sum(Quantity* unitprice) TotalRevneue from [Order Details]
group by ProductID) ProductRevnue
)
order by TotalRevneue DESC;



/*28. Retrieve the category name and the average unit price of products within each category, 
for categories that have at least 10 products, ordered by the average unit price in descending order.*/
--write your query here (9 points)
select CategoryName, avg(UnitPrice) averge from Categories C, Products P 
where P.CategoryID= C.CategoryID 
group by CategoryName
having count(P.ProductID)>=10
order by averge DESC;


/*29. Retrieve the customer ID, company name, and the total quantity of products ordered by each customer, 
for customers who have ordered a total quantity exceeding 1000, ordered by the total quantity in descending order.*/
--write your query here (9 points)

select C.CustomerID, CompanyName , sum(Quantity) TotalQuantity from Customers C, Orders O, [Order Details] OD
where O.CustomerID =C.CustomerID and O.OrderID = OD.OrderID
group by C.CustomerID, CompanyName
having sum(Quantity)>1000
order by TotalQuantity DESC;

/*30. Retrieve the supplier company name and the number of products supplied by each supplier, 
for suppliers who have supplied more products than the average number of products supplied by all suppliers,
ordered by the number of products supplied in descending order.*/
--write your query here (9 points)
select CompanyName , count(ProductId) ProductSupplierCount from Suppliers S , Products P 
where S.SupplierID = P.SupplierID
group by CompanyName
having count(ProductID)>( select avg(NumberofProduct) from  (select SupplierID, count(ProductID) NumberofProduct
from Products
group by SupplierID ) AvrgSuppProCount)
order by ProductSupplierCount DESC;


