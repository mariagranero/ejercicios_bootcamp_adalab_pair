
/*Pedidos por empresa en UK:

Desde las oficinas en UK nos han pedido con urgencia que realicemos una consulta a la base de datos con la que podamos conocer cuántos pedidos ha realizado cada empresa cliente de UK. Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.*/

USE northwind;

SELECT*
FROM orders;

SELECT*
FROM customers;

SELECT c.CompanyName, c.CustomerID, COUNT(DISTINCT o.OrderID) total_pedidos
FROM orders o
INNER JOIN customers c
ON o.customerID = c.customerID
WHERE C.country = 'UK'
GROUP BY c.customerId;


/*Productos pedidos por empresa en UK por año:

Desde Reino Unido se quedaron muy contentas con nuestra rápida respuesta a su petición anterior y han decidido pedirnos una serie de consultas adicionales. La primera de ellas consiste en una query que nos sirva para conocer cuántos objetos ha pedido cada empresa cliente de UK durante cada año. Nos piden concretamente conocer el nombre de la empresa, el año, y la cantidad de objetos que han pedido. Para ello hará falta hacer 2 joins.*/

SELECT*
FROM orders;

SELECT*
FROM customers;

SELECT*
FROM orderdetails; 

SELECT c.CompanyName, YEAR(o.orderdate) año, SUM(ord.quantity) num_objetos
FROM orders o
INNER JOIN customers c
ON o.customerID = c.customerID
INNER JOIN orderdetails ord
ON ord.orderID = o.orderID
WHERE C.country = 'UK'
GROUP BY año, c.companyname
ORDER BY c.companyname, año;



/*Pedidos que han realizado cada compañía y su fecha:

Después de estas solicitudes desde UK y gracias a la utilidad de los resultados que se han obtenido, desde la central nos han pedido una consulta que indique el nombre de cada compañía cliente junto con cada pedido que han realizado y su fecha.*/


SELECT*
FROM orders;

SELECT*
FROM customers;

SELECT o.OrderID, c.CompanyName, o.orderdate fecha
FROM orders o
INNER JOIN customers c
ON o.customerID = c.customerID
ORDER BY c.companyName ASC;



/*Tipos de producto vendidos:

Ahora nos piden una lista con cada tipo de producto que se han vendido, sus categorías, nombre de la categoría y el nombre del producto, y el total de dinero por el que se ha vendido cada tipo de producto (teniendo en cuenta los descuentos).

Pista Necesitaréis usar 3 joins.*/

SELECT*
FROM categories;
SELECT*
FROM products;
SELECT*
FROM orderdetails; 

SELECT ca.categoryid, ca.categoryname, p.productname, SUM(ord.unitprice*ord.quantity*(1-ord.discount)) product_sales
FROM products p
INNER JOIN orderdetails ord
ON p.productid = ord.productid
INNER JOIN categories ca
ON ca.categoryid = p.categoryid
GROUP BY ca.categoryid, ca.categoryname, p.productname




