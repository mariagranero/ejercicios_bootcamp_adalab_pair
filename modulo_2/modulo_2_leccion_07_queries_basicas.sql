USE northwind;

SELECT EmployeeID, LastName,FirstName
FROM employees;

SELECT ProductName, UnitPrice
FROM products
WHERE UnitPrice  BETWEEN 0 AND 5;

SELECT ProductName
FROM products
WHERE UnitPrice IS NULL;

SELECT ProductName
FROM products
WHERE UnitPrice < 15 AND ProductID < 20;

SELECT ProductName
FROM products
WHERE NOT UnitPrice <= 15 AND NOT ProductID <= 20;

SELECT ProductName, UnitPrice, ProductID
FROM products
LIMIT 10;


SELECT ProductName, UnitPrice, ProductID
FROM products
ORDER BY ProductID DESC
LIMIT 10;

SELECT DISTINCT OrderID
FROM orderdetails;

SELECT OrderID, UnitPrice*Quantity AS ImporteTotal
FROM orderdetails
ORDER BY ImporteTotal DESC
LIMIT 5
OFFSET 4;

SELECT ShippedDate, DATE_ADD('ShippedDate', INTERVAL 5 DAY) as fecharetrasada
FROM orders
WHERE ShippedDate IS NOT NULL;

SELECT ProductName
FROM products
wHERE UnitPrice BETWEEN 15 AND 50;

SELECT ProductName, UnitPrice
FROM products
WHERE UnitPrice IN (18,19,20);