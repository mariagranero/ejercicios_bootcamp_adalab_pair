CREATE SCHEMA tienda_zapatillas;
USE tienda_zapatillas;
CREATE TABLE zapatillas (
	id_zapatilla INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(45) NOT NULL,
    color VARCHAR(45) NOT NULL
    );
    
CREATE TABLE clientes (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    num_telefono CHAR(9) NOT NULL,
    email VARCHAR(45) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    ciudad VARCHAR(45) NOT NULL,
    provincia VARCHAR(45) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    codigo_postal VARCHAR(10)
    );
    
CREATE TABLE empleados (
	id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    tienda VARCHAR(45) NOT NULL,
    salario FLOAT NOT NULL,
    fecha_incorporacion DATE NOT NULL
    );
    
CREATE TABLE facturas (
	id_factura INT AUTO_INCREMENT PRIMARY KEY,
    num_factura VARCHAR(45) NOT NULL,
    fecha DATE NOT NULL,
    id_empleado INT NOT NULL,
    id_cliente INT NOT NULL,
    id_zapatilla INT NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
    FOREIGN KEY (id_zapatilla) REFERENCES zapatillas (id_zapatilla)
    ON UPDATE CASCADE
    ON DELETE CASCADE
    );

ALTER TABLE zapatillas
ADD COLUMN marca VARCHAR(45) NOT NULL,
ADD COLUMN talla INT NOT NULL;

SELECT *
FROM zapatillas;

ALTER TABLE empleados
MODIFY COLUMN salario FLOAT NOT NULL;

ALTER TABLE clientes
DROP COLUMN pais;

SELECT *
FROM clientes;

ALTER TABLE facturas
ADD COLUMN total FLOAT;

SELECT *
FROM facturas;

INSERT INTO zapatillas (modelo, color, marca, talla)
VALUES ('XQYUN', 'Negro', 'Nike', 42),
('UOPMN', 'Rosas', 'Nike', 3),
('OPNYT', 'Verdes', 'Adidas', 35);

SELECT *
FROM zapatillas;

INSERT INTO empleados (nombre, tienda, salario, fecha_incorporacion)
VALUES ('Laura', 'Alcobendas', 25987, '2010-09-03'),
('Maria', 'Sevilla', 0 , '2001-04-11'),
('Ester', 'Oviedo', 30165.98 ,'2000-11-29');

SELECT *
FROM empleados;

ALTER TABLE clientes
MODIFY COLUMN num_telefono VARCHAR(20);

INSERT INTO clientes ( id_cliente, nombre, num_telefono, email, direccion, ciudad, provincia,codigo_postal
) VALUES
(1, 'Monica', '1234567289', 'monica@email.com', 'Calle Felicidad', 'Móstoles', 'Madrid', 28176),
(2, 'Lorena', '289345678', 'lorena@email.com', 'Calle Alegria', 'Barcelona', 'Barcelona', 12346),
(3, 'Carmen', '298463759', 'carmen@email.com', 'Calle del Color', 'Vigo', 'Pontevedra', 23456);


INSERT INTO facturas (num_factura,
    fecha,
    id_zapatilla,
    id_empleado,
    id_cliente,
    total
) VALUES
( 123,   '2001-12-11', 1, 2, 1, 54.98),
( 1234,  '2005-05-23', 1, 1, 3, 89.91),
( 12345, '2015-09-18', 2, 3, 3, 76.23);

SELECT *
FROM facturas;

DROP TABLE IF EXISTS facturas;
DROP TABLE IF EXISTS empleados;

UPDATE zapatillas
