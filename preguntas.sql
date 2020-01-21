/*CONSULTA 1: ¿Que cliente realizó la compra más cara?*/

SELECT cust_name FROM customers, bills
WHERE total_value IN (SELECT MAX(total_value) FROM bills) AND  customers.id = bills.customer_id;

/*CONSULTA 2: ¿Que cliente pagó sobre 100.000 de monto?*/

SELECT distinct (cust_name ) FROM customers, bills
WHERE customers.id = bills.customer_id AND bills.total_value > 100000;

 
/*CONSULTA 3: ¿Cuantos clientes han comprado el producto 6?*/

SELECT COUNT(id_product) FROM bills_prod WHERE id_product = 6 ;