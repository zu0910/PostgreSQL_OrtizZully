-----------------------------------------------------------------------------------------------------------------------------------------

--                                    Reto: Auditoría de Ventas

-----------------------------------------------------------------------------------------------------------------------------------------
-- Cree una función que se active al insertar una nueva orden teniendo presente la siguiente instrucción SQL y las sugerencias.

-- DROP TRIGGER IF EXISTS trg_audit_sale ON orders;
-- DROP FUNCTION IF EXISTS fn_register_audit();

CREATE OR REPLACE FUNCTION fn_register_audit()
RETURNS TRIGGER AS $$
DECLARE
  total NUMERIC;
BEGIN
	-- Defina un SELECT para  obtener la información del total de la venta
	-- Usa SUM() de quantity * price
	-- Recuerda que puedes obtener los datos de la nueva orden con NEW e.g.
	-- NEW.order_id
	-- Recuerda el uso de -> INTO total
	SELECT COALESCE(SUM(quantity * price),0) INTO total 
	FROM order_details
	WHERE order_id = NEW.id;
	-- Registra los datos de auditoria en la tabla sales_audit 
	-- Los values los puedes obtener con NEW e.g. 
	-- NEW.order_id, NEW.user_id, total
	INSERT INTO sales_audit (order_id, user_id, total_value,audit_date)
	VALUES(NEW.id, NEW.user_id, total, NOW());
	
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crea el TRIGGER asociado:

CREATE TRIGGER trg_audit_sale
AFTER INSERT ON orders
FOR EACH ROW
EXECUTE FUNCTION fn_register_audit();

INSERT INTO orders (id, orderdate, user_id)
VALUES (11, '2025-04-10', '00001');

SELECT * FROM sales_audit WHERE order_id = 11;

-----------------------------------------------------------------------------------------------------------------------------------------------

-- Crea una VIEW que muestre el historial de ventas con información del usuario y total.

-- Cree la vista teniendo presente la información de la tabla sales_audit 
-- Datos sugeridos a mostrar -> audit_id, username, total_value, audit_date

CREATE VIEW table_sales_audit AS
SELECT sa.audit_id, u.first_name, sa.total_value, sa.audit_date 
FROM sales_audit sa
JOIN users u ON sa.user_id = u.id;

SELECT * FROM table_sales_audit;

-----------------------------------------------------------------------------------------------------------------------------------

-- Crea una MATERIALIZED VIEW que resuma los ingresos diarios.

-- Cree la vista MATERIALIZED teniendo presente la información de la tabla sales_audit 
-- Datos sugeridos a mostrar -> sale_date(DATE de audit_date), daily_total(Suma de los valores de total)
-- Ten presente el GROUP BY y si requieres actualizar la vista puedes usar
-- REFRESH MATERIALIZED VIEW mi_nombre_de_materialized_view;

CREATE MATERIALIZED VIEW daily_sales_summary AS
SELECT 
	DATE(audit_date) AS sale_date,
	SUM(total_value) AS daily_total
FROM sales_audit
GROUP BY DATE(audit_date);
SELECT * FROM daily_sales_summary;
REFRESH MATERIALIZED VIEW daily_sales_summary;

--------------------------------------------------------------------------------------------------------------------------------------

--                               Reto: Gestión de Stock y Ventas con Procedimiento

--------------------------------------------------------------------------------------------------------------------------------------

-- Crea un procedimiento llamado prc_register_sale que permita recibir los valores de user_id, product_id y quantity:
-- DROP PROCEDURE prc_register_sale;
CREATE OR REPLACE PROCEDURE prc_register_sale(
  p_user_id VARCHAR(20),
  p_product_id INT,
  p_quantity INT
)
LANGUAGE plpgsql
AS $$
DECLARE
  -- Define las variables requeridas aqui
  stock_actual INT;
  product_price NUMERIC(10,2);
  new_order_id INT;
  new_detail_id INT;
BEGIN
  -- Verificar stock
  SELECT stock, price INTO stock_actual FROM products WHERE id = p_product_id;
  IF stock_actual < p_quantity THEN
    RAISE EXCEPTION 'Stock insuficiente';
  END IF;
	-- Pasos sugeridos:
  	-- 1. Registrar orden
		INSERT INTO orders (orderdate, user_id)
		VALUES(NOW(), p_user_id)
		RETURNING id INTO new_order_id;
		
  	-- 2. Registrar detalle
	  INSERT INTO order_details (order_id, product_id, quantity, price)
	  VALUES (new_order_id, p_product_id, p_quantity, product_price)
	  RETURNING id INTO new_detail_id;
	  
  	-- 3. Actualizar stock
		UPDATE products
		SET stock = stock - p_quantity
		WHERE id = p_product_id;
END;
$$;

-- CALL prc_register_sale('00001', 1, 2);

-----------------------------------------------------------------------------------------

-- Crea una VIEW llamada vw_products_low_stock para mostrar productos con stock menor a 10:

CREATE VIEW vw_products_low_stock AS
SELECT id, name, stock
FROM products
WHERE stock < 10;

SELECT * FROM vw_products_low_stock;

--------------------------------------------------------------------------------------------------

--                                         Reto: Control de Modificaciones en Pedidos

-----------------------------------------------------------------------------------------------------

-- Crea una FUNCTION para registrar actualizaciones de la tabla orders teniendo presente la siguiente instrucción SQL y las sugerencias.

CREATE OR REPLACE FUNCTION fn_log_order_update()
RETURNS TRIGGER AS $$
BEGIN
	-- Insert
	INSERT INTO orders_update_log(order_id,old_user_id,new_user_id,old_order_date,new_order_date) VALUES (
		new.id,
		old.user_id,
		new.user_id,
		old.orderdate,
		new.orderdate
	); 
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-------------------------------------------------------------------------------------------------------------------------------------------------------

-- Crea un TRIGGER para registrar actualizaciones teniendo presente la siguiente instrucción SQL y las sugerencias.

CREATE TRIGGER trg_log_order_update
AFTER UPDATE ON orders
FOR EACH ROW
-- Cuando la fecha de la orden o el usuario cambie.
-- Usa WHEN, OLD y NEW.
WHEN (old.user_id IS DISTINCT FROM new.user_id OR old.orderdate IS DISTINCT FROM new.orderdate)
EXECUTE FUNCTION fn_log_order_update();

------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Crea una FUNCTION para evitar eliminación si el pedido ya tiene detalles teniendo presente la siguiente instrucción SQL y las sugerencias.

CREATE OR REPLACE FUNCTION fn_prevent_order_delete()
RETURNS TRIGGER AS $$
DECLARE
  exists_detail BOOLEAN;
BEGIN
	-- Valida si existe un detalle asociado al pedido con OLD
	SELECT EXISTS (
		SELECT 1
		FROM order_details
		WHERE order_id = OLD.id
	) INTO exists_detail;
  IF exists_detail THEN
    -- Usa RAISE para mostrar un mensaje adecuado.
	RAISE EXCEPTION 'No se puede eliminar el pedido %', old.id;
  END IF;

  RETURN OLD;
END;
$$ LANGUAGE plpgsql;

------------------------------------------------------------------------------------------------------------------------

-- Crea un TRIGGER para bloquear eliminación teniendo presente la siguiente instrucción SQL y las sugerencias.

CREATE TRIGGER trg_prevent_order_delete
BEFORE DELETE ON orders
FOR EACH ROW
EXECUTE FUNCTION fn_prevent_order_delete();


