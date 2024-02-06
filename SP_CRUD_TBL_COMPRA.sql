--------------------------------------------------------------------------------
------------------ PROCEDIMIENTO ALMACENADO INSERTAR ---------------------------
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Insert_Compra (
        p_Cursor OUT SYS_REFCURSOR,
        p_NumeroFactura IN VARCHAR,
        p_FechaCompra IN DATE,
        p_CantidadComprada IN INT,
        p_PrecioUnitario IN INT,
        p_IdProducto IN INT,
        p_IdProveedor IN INT
    ) AS
    BEGIN
        DECLARE
            v_IdCompra INT;
            v_MontoTotal INT;
        BEGIN
            -- Calcular el monto total
            v_MontoTotal := p_PrecioUnitario * p_CantidadComprada;
    
            -- Insertar la compra
            INSERT INTO Compra (NumeroFactura, FechaCompra, MontoTotal, IdProveedor) 
            VALUES (p_NumeroFactura, p_FechaCompra, v_MontoTotal, p_IdProveedor) 
            RETURNING ID INTO v_IdCompra;
    
            -- Insertar el detalle de la compra
            INSERT INTO DetalleCompra (CantidadComprada, PrecioUnitario, IdProducto, IdCompra) 
            VALUES (p_CantidadComprada, p_PrecioUnitario, p_IdProducto, v_IdCompra);
    
            -- Actualizar la cantidad del producto en la tabla Producto
            UPDATE Producto
            SET Cantidad = Cantidad + p_CantidadComprada
            WHERE Id = p_IdProducto;
    
            -- Asignar el cursor de salida
            OPEN p_Cursor FOR
                SELECT * FROM Compra WHERE ID = v_IdCompra;
    
            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        END;
    END sp_Insert_Compra;

--------------------------------------------------------------------------------
------------------ PROCEDIMIENTO ALMACENADO DELETE -----------------------------
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Delete_Compra (
        p_Cursor OUT SYS_REFCURSOR,
        p_IdCompra IN INT
    ) AS
    BEGIN
        DECLARE
            v_CantidadComprada INT;
            v_IdProducto INT;
        BEGIN
            -- Obtener la cantidad comprada y el IdProducto de la compra
            SELECT dc.CantidadComprada, dc.IdProducto
            INTO v_CantidadComprada, v_IdProducto
            FROM DetalleCompra dc
            WHERE dc.IdCompra = p_IdCompra;
    
            -- Actualizar la cantidad del producto en la tabla Producto
            UPDATE Producto
            SET Cantidad = Cantidad - v_CantidadComprada
            WHERE Id = v_IdProducto;
    
            -- Asignar el cursor de salida
            OPEN p_Cursor FOR
                SELECT * FROM Compra WHERE Id = p_IdCompra;
    
            -- Eliminar el detalle de la compra
            DELETE FROM DetalleCompra
            WHERE IdCompra = p_IdCompra;
    
            -- Eliminar la compra
            DELETE FROM Compra
            WHERE Id = p_IdCompra;
    
            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('Error al eliminar' || SQLERRM);
        END;
    END sp_Delete_Compra;