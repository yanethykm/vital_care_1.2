CREATE OR REPLACE TRIGGER trg_Upd_CantidadProducto
AFTER INSERT ON DetalleVenta
FOR EACH ROW
DECLARE
  v_CantidadVendida INT;
BEGIN
  -- Obtener la cantidad vendida del producto
  SELECT CantidadVendida
  INTO v_CantidadVendida
  FROM DetalleVenta
  WHERE Id = :NEW.Id;

  -- Actualizar la cantidad del producto en el inventario
  UPDATE Producto
  SET Cantidad = Cantidad - v_CantidadVendida
  WHERE Id = :NEW.IdProducto;

  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error al actualizar la cantidad del producto: ' || SQLERRM);
END;
