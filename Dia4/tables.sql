-- CREACION DE TABLA full_order:info


CREATE TABLE full_order_info(
	order_id SERIAL PRIMARY KEY,
	product_id INTEGER NOT NULL,
	quantity SMALLINT NOT NULL,
	price NUMERIC(10,2) NOT NULL, 
	orderdate DATE NOT NULL, 
	user_id VARCHAR(10) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL, 
	email VARCHAR(50) NOT NULL, 
	last_connection INET,
	website VARCHAR(150) NOT NULL,
    name VARCHAR(50) NOT NULL, 
	description TEXT NULL, 
	stock SMALLINT DEFAULT 0, 
	stock_price NUMERIC(10,2) NOT NULL, 
	stockmin SMALLINT DEFAULT 0, 
	stockmax SMALLINT DEFAULT 0
);

-- actualizar un nombre de una tabla 
-- ALTER TABLE nombre_tabla RENAME COLUMN nombre_viejo TO nombre_nuevo;
-- Cambiar el tipo
-- ALTER TABLE nombre_tabla ALTER COLUMN  stockmin TYPE integer;



-- CREAR TABLE DE usuarios
CREATE TABLE users (
	id VARCHAR(20) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    last_connection VARCHAR(100) NOT NULL,
    website VARCHAR(100) NOT NULL
);

ALTER TABLE users ALTER COLUMN last_connection TYPE INET;

-- CREACION DE TABLA products
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    stock SMALLINT DEFAULT 0,
    price NUMERIC(10,2) NOT NULL,
    stockmin SMALLINT DEFAULT 0,
    stockmax SMALLINT DEFAULT 0
);


-- CREACION DE TABLAS orders
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    orderdate DATE NOT NULL,
    user_id VARCHAR(50) NOT NULL
);


-- CREACION DE TABLA order_details
CREATE TABLE order_details (
    id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL, 
    product_id INTEGER NOT NULL,
    quantity SMALLINT NOT NULL,
    price NUMERIC(10,2) NOT NULL
);

ALTER TABLE orders ADD CONSTRAINT fk_user FOREIGN KEY(user_id) REFERENCES users(id);
ALTER TABLE order_details ADD CONSTRAINT fk_order_details FOREIGN KEY(order_id) REFERENCES orders(id);
ALTER TABLE order_details ADD CONSTRAINT fk_product FOREIGN KEY(product_id) REFERENCES products(id);