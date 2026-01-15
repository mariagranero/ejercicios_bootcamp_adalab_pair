USE northwind;

SELECT*
FROM products;

-- Productos más baratos y caros de nuestra la bases de datos:

SELECT MIN(UnitPrice) as producto_mas_barato, MAX(UnitPrice) AS producto_mas_caro
FROM products;


/*Conociendo el numero de productos y su precio medio:

Adicionalmente nos piden que diseñemos otra consulta para conocer el número de productos y el precio medio de todos ellos (en general, no por cada producto).*/

SELECT COUNT(ProductName) AS total_productos, AVG(ROUND(UnitPrice)) AS precio_medio
FROM products;


/*Sacad la máxima y mínima carga de los pedidos de UK:

Nuestro siguiente encargo consiste en preparar una consulta que devuelva la máxima y mínima cantidad de carga para un pedido (freight) enviado a Reino Unido (United Kingdom).*/

SELECT*
FROM orders;

SELECT ROUND(MAX(freight)) AS carga_maxima, 
ROUND(MIN(freight)) AS carga_minima
FROM orders
WHERE ShipCountry = 'UK';



/*Qué productos se venden por encima del precio medio:

Después de analizar los resultados de alguna de nuestras consultas anteriores, desde el departamento de Ventas quieren conocer qué productos en concreto se venden por encima del precio medio para todos los productos de la empresa, ya que sospechan que dicho número es demasiado elevado. También quieren que ordenemos los resultados por su precio de mayor a menor.*/

SELECT ROUND(AVG (UnitPrice), 2) AS precio_medio
FROM products;

SELECT UnitPrice, ProductName
FROM products
WHERE UnitPrice > 28.87
ORDER BY UnitPrice DESC;




/*Qué productos se han descatalogado:

De cara a estudiar el histórico de la empresa nos piden una consulta para conocer el número de productos que se han descatalogado. El atributo Discontinued es un booleano: si es igual a 1 el producto ha sido descontinuado.*/

SELECT*
FROM products;

SELECT SUM(Discontinued) AS num_product_descatalogado
FROM products
WHERE Discontinued = 1;

/*Detalles de los productos de la query anterior:

Adicionalmente nos piden detalles de aquellos productos no descontinuados, sobre todo el ProductID y ProductName. Como puede que salgan demasiados resultados, nos piden que los limitemos a los 10 con ID más elevado, que serán los más recientes. No nos pueden decir del departamento si habrá pocos o muchos resultados, pero lo limitamos por si acaso.*/

SELECT ProductID, ProductName
FROM products
WHERE Discontinued = 0
ORDER BY ProductID DESC
LIMIT 10;



/*Relación entre número de pedidos y gastos de envio máximo:

Desde logística nos piden el número de pedidos y la máxima cantidad de carga de entre los mismos (freight) que han sido enviados por cada empleado (mostrando el ID de empleado en cada caso).*/


SELECT*
FROM orders;

SELECT employeeID, COUNT(OrderID) AS Nº_pedidos, ROUND(MAX(freight)) AS gastos_envio
FROM orders
GROUP BY employeeID;


/*Descartar pedidos sin fecha y ordenarlos:

Una vez han revisado los datos de la consulta anterior, nos han pedido afinar un poco más el "disparo". En el resultado anterior se han incluido muchos pedidos cuya fecha de envío estaba vacía, por lo que tenemos que mejorar la consulta en este aspecto. También nos piden que ordenemos los resultados según el ID de empleado para que la visualización sea más sencilla.*/

SELECT EmployeeID employeeID, COUNT(OrderID) AS Nº_pedidos, ROUND(MAX(freight)) AS gastos_envio
FROM orders
WHERE ShippedDate IS NOT NULL
GROUP BY  employeeID;

-- BONUS:

-- Números de pedidos por día:
/*El siguiente paso en el análisis de los pedidos va a consistir en conocer mejor la distribución de los mismos según las fechas. Por lo tanto, tendremos que generar una consulta que nos saque el número de pedidos para cada día, mostrando de manera separada el día (DAY()), el mes (MONTH()) y el año (YEAR()).*/

SELECT*
FROM orders;

SELECT 
YEAR(OrderDate) AS año,
MONTH(OrderDate) AS mes,
DAY(OrderDate) AS día,
COUNT(orderID) AS num_pedido
FROM orders
GROUP BY año, mes, día;



/*Número de pedidos por mes y año:

La consulta anterior nos muestra el número de pedidos para cada día concreto, pero esto es demasiado detalle. Genera una modificación de la consulta anterior para que agrupe los pedidos por cada mes concreto de cada año.*/

SELECT 
YEAR(OrderDate) AS año,
MONTH(OrderDate) AS mes,
COUNT(orderID) AS num_pedido
FROM orders
GROUP BY año, mes;


/*Selecciona las ciudades con 4 o más empleadas:

Desde recursos humanos nos piden seleccionar los nombres de las ciudades con 4 o más empleadas de cara a estudiar la apertura de nuevas oficinas.*/
SELECT*
FROM employees;

SELECT DISTINCT city, COUNT(EmployeeID) AS nº_empleadas
FROM employees
GROUP BY city
HAVING nº_empleadas >= 4;
