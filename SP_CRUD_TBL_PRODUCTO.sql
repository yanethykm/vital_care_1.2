-------------------------------------------------------------------------------
------------------- PROCEDIMIENTO ALMACENADO INSERT ---------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Insert_Producto (
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
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Update_Producto;

-------------------------------------------------------------------------------
------------------ PROCEDIMIENTO ALMACENADO DELETE ----------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Delete_Producto (
    p_IdProducto IN INT
) AS
BEGIN
    DELETE FROM Producto
    WHERE ID = p_IdProducto;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró un producto con el ID ' || p_IdProducto);
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Delete_Producto;
