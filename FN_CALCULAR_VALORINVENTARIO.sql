CREATE OR REPLACE FUNCTION fn_Calcular_Valor_Inventario RETURN INT AS
    v_ValorTotal INT := 0;
  BEGIN
    SELECT SUM(Cantidad * PrecioVenta)
    INTO v_ValorTotal
    FROM Producto;
    
    RETURN v_ValorTotal;
  END fn_Calcular_Valor_Inventario;
  
CREATE OR REPLACE FUNCTION fn_Verificar_Stock(p_IdProducto IN INT, p_Categoria IN VARCHAR2) RETURN BOOLEAN AS
    v_Cantidad INT;
BEGIN
    SELECT p.cantidad
    INTO v_Cantidad
    FROM Producto p
    INNER JOIN Categoria c ON p.IdCategoria = c.Id
    WHERE p.ID = p_IdProducto
    AND c.Nombre = p_Categoria;

    RETURN v_Cantidad > 0;
END fn_Verificar_Stock;
  
CREATE OR REPLACE FUNCTION fn_Cantidad_Total_Stock RETURN INT AS
    v_Total INT := 0;
  BEGIN
    SELECT SUM(Cantidad)
    INTO v_Total
    FROM Producto;
    
    RETURN v_Total;
  END fn_Cantidad_Total_Stock;
  
CREATE OR REPLACE  FUNCTION fn_Precio_Total_Producto(p_IdProducto IN INT) RETURN INT AS
    v_PrecioTotal INT;
  BEGIN
    SELECT Cantidad * PrecioVenta
    INTO v_PrecioTotal
    FROM Producto
    WHERE ID = p_IdProducto;
    
    RETURN v_PrecioTotal;
  END fn_Precio_Total_Producto;