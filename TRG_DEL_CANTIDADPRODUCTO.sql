CREATE OR REPLACE TRIGGER trg_del_cantidadproducto
AFTER DELETE ON DetalleCompra
FOR EACH ROW
BEGIN
    -- Restar la cantidad comprada de Producto
    UPDATE Producto
    SET Cantidad = Cantidad - :OLD.CantidadComprada
    WHERE Id = :OLD.IdProducto;
END;
