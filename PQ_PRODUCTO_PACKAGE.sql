CREATE OR REPLACE PACKAGE pq_Producto_Package AS
  -- Procedimiento para insertar una nueva producto
  PROCEDURE sp_Insert_Producto (
        p_Cursor OUT SYS_REFCURSOR,
        p_IdProducto IN INT,
        p_Producto IN VARCHAR,
        p_Descripcion IN VARCHAR,
        p_PrecioVenta IN INT,
        p_CantidadMinima IN INT,
        p_Cantidad IN INT,
        p_IdCategoria IN INT,
        p_IdProveedor IN INT
    );

  -- Procedimiento para listar todos los productos
  PROCEDURE sp_List_Producto_DDL (p_Cursor OUT SYS_REFCURSOR);

  -- Procedimiento para actualizar un producto
  PROCEDURE sp_Update_Producto (
        p_Cursor OUT SYS_REFCURSOR,
        p_OldIdProducto IN INT,
        p_NewIdProducto IN INT,
        p_Producto IN VARCHAR,
        p_Descripcion IN VARCHAR,
        p_PrecioVenta IN INT,
        p_CantidadMinima IN INT,
        p_Cantidad IN INT,
        p_IdCategoria IN INT,
        p_IdProveedor IN INT);

  -- Procedimiento para eliminar un producto
  PROCEDURE sp_Delete_Producto (p_Cursor OUT SYS_REFCURSOR, p_IdProducto IN INT);
END pq_Producto_Package;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY pq_Producto_Package AS
  -- Implementación del procedimiento para insertar un producto
    PROCEDURE sp_Insert_Producto (
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

  -- Implementación del procedimiento para listar todos los productos
    PROCEDURE sp_List_Producto_DDL (p_Cursor OUT SYS_REFCURSOR)
    AS
    BEGIN
        OPEN p_Cursor FOR
            SELECT
                p.id AS "Codigo Producto",
                p.producto AS "Producto",
                p.descripcion AS "Descripcion",
                p.precioventa AS "Precio de Venta",
                p.cantidadminima AS "Cantidad Minima",
                p.cantidad AS "Cantidad Existente",
                c.categoria AS "Categoria",
                pv.nombre_razonsocial AS "Nombre del Proveedor",
                pv.apellido AS "Apellido del Proveedor"
            FROM Producto p
            INNER JOIN Categoria c ON p.idcategoria = c.id
            INNER JOIN Proveedor pr ON p.idproveedor = pr.id
            INNER JOIN Persona pv ON pr.idpersona = pv.id;
    END sp_List_Producto_DDL;

  -- Implementación del procedimiento para actualizar un producto
    PROCEDURE sp_Update_Producto (
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

  -- Implementación del procedimiento para eliminar un producto
    PROCEDURE sp_Delete_Producto (p_Cursor OUT SYS_REFCURSOR, p_IdProducto IN INT) AS
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
END pq_Producto_Package;