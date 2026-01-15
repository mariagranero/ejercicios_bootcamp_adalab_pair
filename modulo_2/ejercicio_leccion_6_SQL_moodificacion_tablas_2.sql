USE tienda;

CREATE TABLE IF NOT EXISTS customers_mod 
SELECT * 
FROM customers;

INSERT INTO customers_mod(customer_number,customer_name, contact_last_name, contact_first_name, phone,address_line1,address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES (343,'Adalab','Rodriguez','Julia',672986373,'Calle Falsa 123','Puerta 42','Madrid','España',28000,'España',15,20000000);

INSERT INTO customers_mod (customer_number,customer_name, contact_last_name, contact_first_name, phone,address_line1,address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
VALUES (344,'La pegatina After','Santiago','Maricarmen',00000000,'Travesia del rave',NULL,'Palma de mallorca',NULL,07005,'España',10,45673453);

UPDATE customers_mod
SET address_line1 = 'Poligono Industrial de Son Castelló',address_line2= 'Nave 92', city = 'Palma de mallorca', state = 'España',postal_code = 28123,country ='España', sales_rep_employee_number= 25, credit_limit= 5000000
WHERE customer_name = 'La pegatina After';
