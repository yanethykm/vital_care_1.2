-- Disparador para actualizar la cantidad del producto después de insertar una devolución
CREATE OR REPLACE TRIGGER trg_updcantproducto
AFTER INSERT ON DetalleCompra
FOR EACH ROW
BEGIN
    UPDATE Producto
    SET Cantidad = Cantidad + :NEW.CantidadComprada
    WHERE Id = :NEW.IdProducto;
END;



