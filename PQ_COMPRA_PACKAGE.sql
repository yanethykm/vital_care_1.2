CREATE OR REPLACE PACKAGE pq_Compra_Package AS
  -- Procedimiento para insertar una nueva compra
  PROCEDURE sp_Insert_Compra (
        p_Cursor OUT SYS_REFCURSOR,
        p_NumeroFactura IN VARCHAR,
        p_FechaCompra IN DATE,
        p_CantidadComprada IN INT,
        p_PrecioUnitario IN INT,
        p_IdProducto IN INT,
        p_IdProveedor IN INT);

  -- Procedimiento para listar todas las compras
  PROCEDURE sp_List_Compra_DDL (p_Cursor OUT SYS_REFCURSOR);

  -- Procedimiento para eliminar una compra
  PROCEDURE sp_Delete_Compra (p_Cursor OUT SYS_REFCURSOR, p_IdCompra IN INT);
END pq_Compra_Package;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY pq_Compra_Package AS
  -- Implementación del procedimiento para insertar una nueva compra
    PROCEDURE sp_Insert_Compra (
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

  -- Implementación del procedimiento para listar todas las compras
    PROCEDURE sp_List_Compra_DDL (p_Cursor OUT SYS_REFCURSOR)
    IS
    BEGIN
        OPEN p_Cursor FOR
            SELECT
                c.id,
                C.NumeroFactura AS "Numero de Factura",
                C.FechaCompra AS "Fecha Compra",
                C.MontoTotal AS "Total Factura",
                DC.CantidadComprada AS "Cantidad Comprada",
                DC.PrecioUnitario AS "Precio Unitario",
                P.producto AS "Producto",
                P.Cantidad AS "Existencias",
                PV.Nombre_RazonSocial AS "Nombre Proveedor"
            FROM Compra C
            INNER JOIN Proveedor PR ON C.idproveedor = pr.id
            INNER JOIN Persona PV ON PR.idpersona = PV.id
            INNER JOIN DetalleCompra DC ON c.id = dc.idcompra
            INNER JOIN Producto P ON dc.idproducto = p.id;
    END sp_List_Compra_DDL;

  -- Implementación del procedimiento para eliminar una compra
    PPROCEDURE sp_Delete_Compra (
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
END pq_Compra_Package;