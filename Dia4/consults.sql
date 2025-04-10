-- CONSULTAS

SELECT SUM(stock_price), SUM(stock), stockmin, stockmax, name 
FROM full_order_info
GROUP BY name,stockmin,stockmax;

-- Saber cuantos es el valor total que hemos invertido en stock 
-- stock_price y stock cuanto 

SELECT * FROM full_order_info;

-- Suma todos los stock y los stock prices
select name, SUM(stock) as Stock, SUM(stock_price) AS stock_price FROM full_order_info GROUP BY 1;

-- total de dinero 

SELECT name, SUM(stock * stock_price) AS total_price FROM full_order_info GROUP BY 1;

-- Crear vista 

CREATE VIEW stock_product_rage AS
SELECT SUM(stock_price) AS stock_price, SUM(stock) as Stock, stockmin, stockmax, name  FROM full_order_info GROUP BY name, stockmin, stockmax;

CREATE VIEW stock_product AS 
SELECT name, SUM(stock * stock_price) AS total_price FROM full_order_info GROUP BY 1;

-- Nostrar las vistas
SELECT * FROM stock_product;
-- Mostrar la vista solo de un nombre
SELECT * FROM stock_product WHERE NAME = 'Webcam';

--Mostrar vista de stock_product_rage
SELECT * FROM stock_product_rage;



CREATE MATERIALIZED VIEW sotck_avg AS
SELECT SUM(stock_price) AS stock_price, SUM(stock) as Stock, stockmin, stockmax, name  FROM full_order_info GROUP BY name, stockmin, stockmax;
REFRESH MATERIALIZED VIEW sotck_avg;
SELECT * FROM sotck_avg;

-- INNER JOIN 
SELECT users.id, users.first_name, orders.orderdate
FROM users
LEFT JOIN orders ON users.id = orders.user_id;

-- Usuarios que no hayan hecho nunguna orden 
SELECT users.id, users.first_name, orders.id, orders.orderdate
FROM users
LEFT OUTER JOIN orders ON users.id = orders.user_id WHERE orders.id IS NULL;

SELECT users.id, users.first_name, orders.orderdate, od.product_id,  od.quantity, p.name
FROM users
RIGHT JOIN orders ON users.id = orders.user_id
LEFT JOIN order_details od ON orders.id = od.order_id
LEFT JOIN products p ON od.product_id = p.id;

CREATE VIEW order_detail_view AS
SELECT users.id AS user_id, users.first_name, orders.orderdate, od.product_id,  od.quantity, p.name
FROM users
RIGHT JOIN orders ON users.id = orders.user_id
LEFT JOIN order_details od ON orders.id = od.order_id
LEFT JOIN products p ON od.product_id = p.id;


CREATE OR REPLACE PROCEDURE total_amount(p_id_user VARCHAR(20))
LANGUAGE plpgsql 
AS $$
DECLARE 
	total NUMERIC;
BEGIN
	SELECT SUM(quantity::numeric * price::numeric)
	INTO total
	FROM order_detail_view
	WHERE user_id = id_user;

	RAISE NOTICE 'El total el $ gastado % es % ', p_id_user, total ;
END
$$;
CALL total_amount('00005');