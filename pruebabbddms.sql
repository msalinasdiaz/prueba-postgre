CREATE DATABASE test_bbdd;

--DDL

CREATE TABLE customers(
id SERIAL, cust_name VARCHAR(19), rut VARCHAR(19), address VARCHAR(30), PRIMARY KEY(id));

CREATE TABLE categories(id VARCHAR(10), tipe_cat VARCHAR(19), cat_desc VARCHAR(30));

CREATE TABLE products(id SERIAL, product_name VARCHAR(19), desc_prod VARCHAR(30), 
value INT, category_id VARCHAR(8));

CREATE TABLE bills(
bills_id SERIAL, bills_date DATE, subtotal INT, iva INT, total_value INT, customer_id INT,
PRIMARY KEY(bills_id), FOREIGN KEY(customer_id) REFERENCES customers(id));

CREATE TABLE bills_prod(
id_register INT, product_id VARCHAR(15), value INT, Q INT, subtotal INT, bills_id INT);

--DML

INSERT INTO customers (cust_name, rut, address) VALUES ('GINO', '163616823', 'PORTUGAL 256'),
('POLLINI', '12345679', 'HUERFANOS 203'), ('MINGO', '98765432', 'MALL PLAZA EGAÑA'),('GINO', '178376721', 'MARIN 014'),
('ZAPPA', '173846372', 'PORTUGAL 564');


INSERT INTO categories (id, tipe_cat, cat_desc) VALUES ('1', 'NIÑO', 'CALZADO NIÑO'),
('2', 'MUJER', 'CALZADO'), ('3', 'HOMBRE', 'CALZADO HOMBRE');


INSERT INTO bills (bills_date, subtotal, iva, total_value, customer_id) VALUES 
('2019-12-10', '10000', '28000', '99000', '1'),
('2019-12-12', '25000', '85500', '12560', '1'), 
('2019-12-14', '12000', '39900', '34000', '2'),
('2019-12-14', '13000', '19000', '22200', '2'), 
('2019-12-16', '14000', '68400', '45600', '2'),
('2019-12-16', '15000', '38300', '20000	','3'), 
('2019-12-17', '45000', '76000', '44500', '4'),
('2019-12-18', '22000', '11400', '72300', '4'), 
('2019-12-19', '34000', '76000', '98000', '4'),
('2019-12-31', '12300', '17000', '28000', '4');

INSERT INTO products (product_name, desc_prod, value, category_id) VALUES 
('AIR MAX90', 'ZAPATILLA HOMBRE', '90000', '3'), 
('CHALABOTA', 'CHALA PARA MINA', '30000', '2'), 
('CHANCLETA', 'MODA AÑOS 30', '10000', '3'),
('CHALATILLA', 'MODA CUMA MUJER', '60000', '2'), 
('PANTUFLA', 'MODA LANA HOMBRE', '70000', '3'), 
('BOTIN', 'MODA MUJER 2020','12000', '2'), 
('BUBBLE', 'MODA NIÑO', '2000', '1'), 
('OJOTA', 'MODA HUASO 2020', '15000', '1');


INSERT INTO bills_prod (id_register, product_id, value, Q, subtotal, bills_id) VALUES 
('1', 'AIR MAX90', '90000', '2', '180000', '1'),
('2', 'CHALABOTA', '30000', '3', '90000', '2'),
('4', 'CHANCLETA', '10000', '3', '30000', '3'),
('5', 'CHALATILLA', '60000', '2', '120000', '4'),
('6', 'PANTUFLA', '70000', '3', '210000', '5'),
('7', 'BOTIN', '12000', '1', '12000', '6'),
('8', 'BUBBLE', '2000', '2', '4000', '7'),
('7', 'OJOTA', '15000', '3', '45000', '8'),
('3', 'CHANCLETA', '10000', '4', '40000', '9'),
('1', 'AIR MAX90', '90000', '1', '90000', '10');

ALTER TABLE categories ADD PRIMARY KEY(id);
ALTER TABLE products ADD PRIMARY KEY(id);
ALTER TABLE products ADD FOREIGN KEY(category_id) REFERENCES categories(id);
ALTER TABLE bills_prods ADD FOREIGN KEY(bills_id) REFERENCES bills(bills_number);
ALTER TABLE bills_prods ADD FOREIGN KEY(bills_id) REFERENCES products(id);
ALTER TABLE bills_prods RENAME COLUMN bills_id TO id_product;