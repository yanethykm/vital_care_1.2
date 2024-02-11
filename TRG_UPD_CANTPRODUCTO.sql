-- Disparador para actualizar la cantidad del producto despu�s de insertar una devoluci�n
CREATE OR REPLACE TRIGGER trg_updcantproducto
AFTER INSERT ON DetalleCompra
FOR EACH ROW
BEGIN
    UPDATE Producto
    SET Cantidad = Cantidad + :NEW.CantidadComprada
    WHERE Id = :NEW.IdProducto;
END;



