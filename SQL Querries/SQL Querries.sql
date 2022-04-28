--Usage of general T-SQL querries.

--SELECT 

SELECT * FROM Products

--Reading specific columns from table.
SELECT EmployeeID, FirstName, LastName FROM Employees

--Giving special names to columns.

SELECT CompanyName AS [Company Name], 
	   Phone AS Telefon 
FROM Shippers

--WHERE
SELECT ProductID,
       ProductName,
	   UnitPrice,
	   UnitsInStock
from Products
WHERE UnitPrice > 35

--between - and

SELECT * 
FROM Products
WHERE UnitPrice between 18 and 25

--or

SELECT * 
FROM Products
WHERE UnitPrice=18 or UnitPrice = 25

SELECT * 
FROM Products
WHERE UnitPrice in (18,25,30,54)

--Using built-in function DATEDIFF and GETDATE to calculate Employee's age.

SELECT (FirstName+' '+LastName) as [Full Name],
		DATEDIFF("YY", BirthDate, GETDATE()) as Age
FROM Employees
WHERE DATEDIFF("YY", BirthDate, GETDATE()) > 60

--To read first result, we use TOP 
--Order by 
SELECT TOP 1 ProductID,
	   ProductName,
	   UnitPrice,
	   UnitsInStock
FROM Products
WHERE UnitsInStock > 100
ORDER BY UnitsInStock desc

--Aggregate Functions
--SUM() function returns the total sum of a numeric column. 
SELECT Sum(UnitsInStock) AS [Total Stock] FROM Products

--COUNT() function returns the number of rows that given inside parameter.
SELECT Count(OrderId) FROM Orders

--GROUP BY is used to group rows that have the same value.
SELECT CategoryID,
	   COUNT(*) AS Adet
FROM Products
GROUP BY CategoryID

--Average()
select Cast(avg(Quantity*UnitPrice*(1-Discount))as smallmoney) from [Order Details]

-- min () % max ()
select MIN(UnitsInStock) from Products
select MAX(UnitsInStock) from Products

--HAVING is used to do same thing as where because where cant be used with aggregate functions.
SELECT OrderID,
       Sum(Quantity) AS [Total Product]
FROM [Order Details]
GROUP BY OrderID
HAVING Sum(Quantity) > 200
ORDER BY [Total Product] DESC

-- Join is used to combine rows from tables.
SELECT p.ProductID,
       p.ProductName,
	   c.CategoryID,
	   c.CategoryName
FROM Products p
join Categories c ON p.CategoryID = c.CategoryID

-- Left join is used to returns all records from the left table and matchings from right.
SELECT CompanyName,
	   OrderID
FROM Customers c
left join Orders o ON c.CustomerID = o.CustomerID
WHERE OrderID is null

--Right join - opposite of left join
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;

--Distinct is used to return only different values.
SELECT Count(distinct City) FROM Employees

--Like Operator

SELECT * --First name starts with "A" letter
FROM Employees
WHERE FirstName like 'A%'
ORDER BY FirstName asc

SELECT * -- First name where contains "E" letter.
FROM Employees
WHERE FirstName  like '%E%' 
ORDER BY FirstName asc

--Not Like
SELECT * 
FROM Employees 
WHERE FirstName not like '%M%'

--Group By() ; The GROUP BY statement groups rows that have the same values into summary rows, like "find the number of products in each Category".

select CategoryID,
	   COUNT(*) as Quantity 
from Products 
group by CategoryID

select CategoryID,
	   COUNT(*) as Quantity 
from Products 
where UnitPrice >35 
group by CategoryID

--Having is used with aggregate functions since Where cannot be used with aggregates..

select CategoryID,
sum(UnitsInStock) as [Stock Quantity]
from Products
group by CategoryID
having sum(UnitsInStock)<400
order by [Stock Quantity] desc
