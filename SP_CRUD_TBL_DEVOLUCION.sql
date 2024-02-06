--------------------------------------------------------------------------------------
------------------- PROCEDIMIENTO ALMACENADO INSERT ----------------------------------
--------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE sp_Insert_Devolucion(
        p_Cursor OUT SYS_REFCURSOR,
        p_FechaDevolucion IN DATE,
        p_CantidadDevuelta IN INT,
        p_RazonDevolucion IN VARCHAR,
        p_IdVenta IN INT
    )AS
        v_ProductoId INT;
        v_CantidadOriginal INT;
    BEGIN
        -- Obtener el Id del Producto y la cantidad original desde DetalleVenta
        SELECT dv.idproducto, dv.cantidadvendida
        INTO v_ProductoId, v_CantidadOriginal
        FROM DetalleVenta dv
        WHERE dv.idventa = p_IdVenta;
    
        -- Insertar la devolución
        INSERT INTO Devolucion (
            FechaDevolucion,
            CantidadDevuelta,
            RazonDevolucion,
            IdVenta
        ) VALUES (
            p_FechaDevolucion,
            p_CantidadDevuelta,
            p_RazonDevolucion,
            p_IdVenta
        );
    
        -- Actualizar la cantidad del producto en la tabla Producto
        UPDATE Producto
        SET Cantidad = Cantidad + p_CantidadDevuelta
        WHERE Id = v_ProductoId;
    
        -- Abrir el cursor de salida con los datos de la devolución
        OPEN p_Cursor FOR
            SELECT * FROM Devolucion WHERE IdVenta = p_IdVenta;
    
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_Insert_Devolucion;
--------------------------------------------------------------------------------------
------------------- PROCEDIMIENTO ALMACENADO LIST ------------------------------------
--------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_List_Devolucion_DDL(p_Cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN p_Cursor FOR
            SELECT 
                d.id,
                D.FechaDevolucion as "Fecha de Devolucion",
                D.CantidadDevuelta as "Cantidad Devuelta",
                D.RazonDevolucion as "Razon de Devolucion",
                V.Fecha as "Fecha de Venta",
                PCliente.Nombre_RazonSocial as "Nombre Cliente",
                PVendedor.Nombre_RazonSocial as "Nombre Vendedor",
                DV.CantidadVendida as "Cantidad Vendida",
                P.Producto as "Producto",
                P.Descripcion as "Descripcion",
                P.PrecioVenta as "Precio de Venta"
            FROM Devolucion D
            INNER JOIN Venta V ON D.IdVenta = V.ID
            INNER JOIN Cliente C ON V.IdCliente = C.ID
            INNER JOIN Persona PCliente ON C.IdPersona = PCliente.ID
            INNER JOIN Vendedor Vd ON V.IdVendedor = Vd.ID
            INNER JOIN Persona PVendedor ON Vd.IdPersona = PVendedor.ID
            INNER JOIN DetalleVenta DV ON D.IdVenta = DV.IdVenta
            INNER JOIN Producto P ON DV.IdProducto = P.ID;
    END sp_List_Devolucion_DDL;