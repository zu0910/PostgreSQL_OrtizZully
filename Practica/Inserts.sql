-- INSERCIONES

INSERT INTO users ("id", "first_name", "last_name", "email", "last_connection", "website") 
VALUES ('00001', 'Pamela', 'Harvey', 'pamela.harvey@icloud.com', '130.169.26.40', 'https://www.cummings-myers.com/');
INSERT INTO users ("id", "first_name", "last_name", "email", "last_connection", "website") 
VALUES ('00002', 'Zachary', 'Lopez', 'zachary.lopez@icloud.com', '71.36.0.117', 'https://www.jimenez.com/');
INSERT INTO users ("id", "first_name", "last_name", "email", "last_connection", "website") 
VALUES ('00003', 'Heather', 'Tucker', 'heather.tucker@hotmail.com', '149.255.250.172', 'https://jones.net/');
INSERT INTO users ("id", "first_name", "last_name", "email", "last_connection", "website") 
VALUES ('00004', 'Amanda', 'Khan', 'amanda.khan@icloud.com', '131.155.80.238', 'http://hebert.com/');
INSERT INTO users ("id", "first_name", "last_name", "email", "last_connection", "website") 
VALUES ('00005', 'Tammy', 'Cordova', 'tammy.cordova@yahoo.com', '114.150.104.42', 'http://www.horton.com/');
INSERT INTO users ("id", "first_name", "last_name", "email", "last_connection", "website") 
VALUES ('00006', 'Steven', 'Carr', 'steven.carr@yahoo.com', '68.70.110.86', 'https://www.nelson.com/');
INSERT INTO users ("id", "first_name", "last_name", "email", "last_connection", "website") 
VALUES ('00007', 'Jon', 'Harris', 'jon.harris@gmail.com', '51.171.236.174', 'https://jennings-johnson.com/');
INSERT INTO users ("id", "first_name", "last_name", "email", "last_connection", "website") 
VALUES ('00008', 'Jonathan', 'Rosales', 'jonathan.rosales@yahoo.com', '192.250.4.45', 'http://www.banks.info/');
INSERT INTO users ("id", "first_name", "last_name", "email", "last_connection", "website") 
VALUES ('00009', 'Juan', 'Taylor', 'juan.taylor@hotmail.com', '108.144.245.239', 'https://carrillo-garrison.info/');
INSERT INTO users ("id", "first_name", "last_name", "email", "last_connection", "website") 
VALUES ('00010', 'Cynthia', 'Gomez', 'cynthia.gomez@gmail.com', '166.180.144.101', 'https://www.bautista.com/');
INSERT INTO users ("id", "first_name", "last_name", "email", "last_connection", "website") 
VALUES ('00011', 'Jeremy', 'Monroe', 'jeremy.monroe@outlook.com', '217.91.149.219', 'https://gardner.info/');

-------------------------------------------------------------------------------------------------------------------------

-- INSERTAR DATOS EN LA TABLA products

INSERT INTO products ("name", "description", "stock", "price", "stockmin", "stockmax") 
VALUES ('Laptop', 'Lot old magazine learn close art physical.', 97, 1084.85, 10, 98);
INSERT INTO products ("name", "description", "stock", "price", "stockmin", "stockmax") 
VALUES ('Smartphone', 'Unit economy bad including recent three seem offer continue rest.', 74, 545.58, 9, 172);
INSERT INTO products ("name", "description", "stock", "price", "stockmin", "stockmax") 
VALUES ('Tablet', 'Attorney ground hair senior customer exist.', 31, 1309.25, 1, 86);
INSERT INTO products ("name", "description", "stock", "price", "stockmin", "stockmax") 
VALUES ('Monitor', 'Trial per movement fast day help and hold.', 40, 234.68, 6, 111);
INSERT INTO products ("name", "description", "stock", "price", "stockmin", "stockmax") 
VALUES ('Keyboard', 'Doctor hear lay white ready color action option tough past she.', 99, 1052.35, 87, 199);
INSERT INTO products ("name", "description", "stock", "price", "stockmin", "stockmax") 
VALUES ('Mouse', 'West end year he quickly life with left list hospital describe unit possible.', 32, 1208.06, 13, 54);
INSERT INTO products ("name", "description", "stock", "price", "stockmin", "stockmax") 
VALUES ('Printer', 'Before test for information teach least go wear.', 74, 884.87, 42, 103);
INSERT INTO products ("name", "description", "stock", "price", "stockmin", "stockmax") 
VALUES ('Headphones', 'First political pattern anything news be machine while.', 44, 56.86, 21, 119);
INSERT INTO products ("name", "description", "stock", "price", "stockmin", "stockmax") 
VALUES ('Webcam', 'Standard second believe prove physical end future again both account century.', 32, 377.28, 8, 62);
INSERT INTO products ("name", "description", "stock", "price", "stockmin", "stockmax") 
VALUES ('USB Drive', 'Rate trouble rich prepare visit total sell spring save here pick manager.', 73, 359.74, 33, 124);

----------------------------------------------------------------------------------------------------------------------------

-- INSERTAR DATOS DE LA TABLA orders

INSERT INTO orders ("id", "orderdate", "user_id")
VALUES (1, '2025-02-16', '00005');
INSERT INTO orders ("id", "orderdate", "user_id")
VALUES (2, '2025-03-06', '00005');
INSERT INTO orders ("id", "orderdate", "user_id")
VALUES (3, '2025-03-25', '00005');
INSERT INTO orders ("id", "orderdate", "user_id")
VALUES (4, '2025-03-18', '00003');
INSERT INTO orders ("id", "orderdate", "user_id")
VALUES (5, '2025-03-10', '00001');
INSERT INTO orders ("id", "orderdate", "user_id")
VALUES (6, '2025-02-13', '00003');
INSERT INTO orders ("id", "orderdate", "user_id")
VALUES (7, '2025-02-11', '00006');
INSERT INTO orders ("id", "orderdate", "user_id")
VALUES (8, '2025-03-16', '00009');
INSERT INTO orders ("id", "orderdate", "user_id")
VALUES (9, '2025-02-27', '00002');
INSERT INTO orders ("id", "orderdate", "user_id")
VALUES (10, '2025-03-22', '00003');

-----------------------------------------------------------------------

-- INSERTAR DATOS EN LA TABLA order_details

INSERT INTO order_details ("id", "order_id", "product_id", "quantity", "price")
VALUES (1, 1, 9, 5, 544.2);
INSERT INTO order_details ("id", "order_id", "product_id", "quantity", "price")
VALUES (2, 2, 10, 2, 428.26);
INSERT INTO order_details ("id", "order_id", "product_id", "quantity", "price")
VALUES (3, 3, 2, 4, 250.73);
INSERT INTO order_details ("id", "order_id", "product_id", "quantity", "price")
VALUES (4, 4, 1, 5, 811.79);
INSERT INTO order_details ("id", "order_id", "product_id", "quantity", "price")
VALUES (5, 4, 10, 5, 428.26);
INSERT INTO order_details ("id", "order_id", "product_id", "quantity", "price")
VALUES (6, 5, 4, 1, 1432.67);
INSERT INTO order_details ("id", "order_id", "product_id", "quantity", "price")
VALUES (7, 5, 5, 1, 1146.23);
INSERT INTO order_details ("id", "order_id", "product_id", "quantity", "price")
VALUES (8, 6, 6, 1, 322.04);
INSERT INTO order_details ("id", "order_id", "product_id", "quantity", "price")
VALUES (9, 7, 4, 5, 1432.67);
INSERT INTO order_details ("id", "order_id", "product_id", "quantity", "price")
VALUES (10, 8, 1, 1, 811.79);
INSERT INTO order_details ("id", "order_id", "product_id", "quantity", "price")
VALUES (11, 9, 7, 1, 517.03);
INSERT INTO order_details ("id", "order_id", "product_id", "quantity", "price")
VALUES (12, 9, 10, 5, 428.26);

---------------------------------------------------------------------------------------------

-- Insertar datos en la tabla sales_audit 

INSERT INTO sales_audit (order_id, user_id, total_value, audit_date)
VALUES (1, '00005', 856.54, '2025-03-06 15:30:00');
INSERT INTO sales_audit (order_id, user_id, total_value, audit_date)
VALUES (2, '00005', 2721.00, '2025-02-16 14:00:00');
INSERT INTO sales_audit (order_id, user_id, total_value, audit_date)
VALUES (3, '00005', 1002.92, '2025-03-25 10:00:00');
INSERT INTO sales_audit (order_id, user_id, total_value, audit_date)
VALUES (4, '00003', 6200.25, '2025-03-18 12:45:00');
INSERT INTO sales_audit (order_id, user_id, total_value, audit_date)
VALUES (5, '00001', 2578.90, '2025-03-10 16:20:00');
INSERT INTO sales_audit (order_id, user_id, total_value, audit_date)
VALUES (6, '00003', 322.04, '2025-02-13 16:20:00');
INSERT INTO sales_audit (order_id, user_id, total_value, audit_date)
VALUES (7, '00006', 700.54, '2025-06-17 18:35:04');
INSERT INTO sales_audit (order_id, user_id, total_value, audit_date)
VALUES (8, '00009', 856.54, '2025-03-09 13:10:00');
INSERT INTO sales_audit (order_id, user_id, total_value, audit_date)
VALUES (9, '00002', 800.54, '2025-07-03 11:30:00');
INSERT INTO sales_audit (order_id, user_id, total_value, audit_date)
VALUES (10, '00003', 23.22, '2025-03-22 08:30:00');