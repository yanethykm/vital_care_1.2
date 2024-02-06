-------------------------------------------------------------------------------
------------------- PROCEDIMIENTO ALMACENADO INSERT ---------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Insert_Producto (
        p_Cursor OUT SYS_REFCURSOR,
        p_IdProducto IN INT,
        p_Producto IN VARCHAR,
        p_Descripcion IN VARCHAR,
        p_PrecioVenta IN INT,
        p_CantidadMinima IN INT,
        p_Cantidad IN INT,
        p_IdCategoria IN INT,
        p_IdProveedor IN INT
    ) AS
    BEGIN
        INSERT INTO Producto (ID, Producto, Descripcion, PrecioVenta, CantidadMinima, Cantidad, IdCategoria, IdProveedor)
        VALUES (p_IdProducto, p_Producto, p_Descripcion, p_PrecioVenta, p_CantidadMinima, p_Cantidad, p_IdCategoria, p_IdProveedor);
        
        -- Asignar el cursor de salida
        OPEN p_Cursor FOR
            SELECT * FROM Producto WHERE ID = p_IdProducto;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_Insert_Producto;

--------------------------------------------------------------------------------
----------------------- PROCEDIMIENTO ALMACENADO UPDATE ------------------------
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Update_Producto (
        p_Cursor OUT SYS_REFCURSOR,
        p_OldIdProducto IN INT,
        p_NewIdProducto IN INT,
        p_Producto IN VARCHAR,
        p_Descripcion IN VARCHAR,
        p_PrecioVenta IN INT,
        p_CantidadMinima IN INT,
        p_Cantidad IN INT,
        p_IdCategoria IN INT,
        p_IdProveedor IN INT
    ) AS
    BEGIN
        UPDATE Producto
        SET
            ID = p_NewIdProducto,
            Producto = p_Producto,
            Descripcion = p_Descripcion,
            PrecioVenta = p_PrecioVenta,
            CantidadMinima = p_CantidadMinima,
            Cantidad = p_Cantidad,
            IdCategoria = p_IdCategoria,
            IdProveedor = p_IdProveedor
        WHERE
            ID = p_OldIdProducto;
        
        -- Asignar el cursor de salida
        OPEN p_Cursor FOR
            SELECT * FROM Producto WHERE ID = p_NewIdProducto;
            
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_Update_Producto;

-------------------------------------------------------------------------------
------------------ PROCEDIMIENTO ALMACENADO DELETE ----------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Delete_Producto (p_Cursor OUT SYS_REFCURSOR, p_IdProducto IN INT) AS
    BEGIN
        -- Guardar datos del producto antes de eliminarlo
        OPEN p_Cursor FOR
            SELECT * FROM Producto WHERE ID = p_IdProducto;
            
        DELETE FROM Producto
        WHERE ID = p_IdProducto;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_Delete_Producto;
