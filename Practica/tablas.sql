-- CREACIÓN DE TABLAS 

CREATE TABLE users (
    id VARCHAR(20) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    last_connection INET NOT NULL,
    website TEXT NOT NULL
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    stock INTEGER NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    stockmin INTEGER NOT NULL,
    stockmax INTEGER NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    orderdate DATE NOT NULL,
    user_id VARCHAR(50) NOT NULL
);

CREATE TABLE order_details (
    id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL, 
    product_id INTEGER NOT NULL,
    quantity SMALLINT NOT NULL,
    price NUMERIC(10,2) NOT NULL
);

ALTER TABLE orders ADD CONSTRAINT fk_user FOREIGN KEY(user_id) REFERENCES users(id);
ALTER TABLE order_details ADD CONSTRAINT fk_order FOREIGN KEY(order_id) REFERENCES orders(id);
ALTER TABLE order_details ADD CONSTRAINT fk_product FOREIGN KEY(product_id) REFERENCES products(id);

-------------------------------------------
-- Creación de la tabla auditoría de ventas  

CREATE TABLE sales_audit (
	audit_id SERIAL PRIMARY KEY,
	order_id INTEGER NOT NULL,
	user_id VARCHAR(20) NOT NULL,
	total_value NUMERIC(10,2) NOT NULL,
	audit_date TIMESTAMP DEFAULT NOW() NOT NULL,
	FOREIGN KEY(user_id) REFERENCES users(id),
	FOREIGN KEY(order_id) REFERENCES products(id)
);

ALTER TABLE sales_audit
DROP CONSTRAINT sales_audit_order_id_fkey;

ALTER TABLE sales_audit
ADD CONSTRAINT sales_audit_order_id_fkey
FOREIGN KEY (order_id) REFERENCES orders(id);

DELETE FROM sales_audit WHERE order_id NOT IN (SELECT id FROM orders);

CREATE TABLE orders_update_log (
  log_id SERIAL PRIMARY KEY,
  order_id INT,
  old_user_id INT,
  new_user_id INT,
  old_order_date DATE,
  new_order_date DATE,
  changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);