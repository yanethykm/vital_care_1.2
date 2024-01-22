CREATE OR REPLACE PACKAGE pq_Compra_Package AS
  -- Procedimiento para insertar una nueva compra
  PROCEDURE sp_Insert_Compra(
    p_NumeroFactura IN VARCHAR,
    p_FechaCompra IN DATE,
    p_CantidadComprada IN INT,
    p_PrecioUnitario IN INT,
    p_IdProducto IN INT,
    p_MontoTotal IN DECIMAL,
    p_IdProveedor IN INT );

  -- Procedimiento para listar todas las compras
  PROCEDURE sp_List_Compra_DDL;

  -- Procedimiento para eliminar una compra
  PROCEDURE sp_Delete_Compra(p_IdCompra IN INT);
END pq_Compra_Package;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY pq_Compra_Package AS
  -- Implementación del procedimiento para insertar una nueva compra
    PROCEDURE sp_Insert_Compra(
        p_NumeroFactura IN VARCHAR,
        p_FechaCompra IN DATE,
        p_CantidadComprada IN INT,
        p_PrecioUnitario IN INT,
        p_IdProducto IN INT,
        p_MontoTotal IN DECIMAL,
        p_IdProveedor IN INT
    )
    AS
    BEGIN
        DECLARE
            v_IdCompra INT;
        BEGIN
            -- Insertar la compra
            INSERT INTO Compra (NumeroFactura, FechaCompra, MontoTotal, IdProveedor) 
            VALUES (p_NumeroFactura, p_FechaCompra, p_MontoTotal, p_IdProveedor) 
            RETURNING ID INTO v_IdCompra;
    
            -- Insertar el detalle de la compra
            INSERT INTO DetalleCompra (CantidadComprada, PrecioUnitario, IdProducto, IdCompra) 
            VALUES (p_CantidadComprada, p_PrecioUnitario, p_IdProducto, v_IdCompra);
    
            -- Actualizar la cantidad del producto en la tabla Producto
            UPDATE Producto
            SET Cantidad = Cantidad + p_CantidadComprada
            WHERE Id = p_IdProducto;
    
            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        END;
    END sp_Insert_Compra;

  -- Implementación del procedimiento para listar todas las compras
    PROCEDURE sp_List_Compra_DDL
    IS
    BEGIN
        FOR compra IN (
            SELECT
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
            INNER JOIN Producto P ON dc.idproducto = p.id
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE('Numero de Factura: ' || compra."Numero de Factura");
            DBMS_OUTPUT.PUT_LINE('Fecha Compra: ' || compra."Fecha Compra");
            DBMS_OUTPUT.PUT_LINE('Total Factura: ' || compra."Total Factura");
            DBMS_OUTPUT.PUT_LINE('Cantidad Comprada: ' || compra."Cantidad Comprada");
            DBMS_OUTPUT.PUT_LINE('Precio Unitario: ' || compra."Precio Unitario");
            DBMS_OUTPUT.PUT_LINE('Producto: ' || compra."Producto");
            DBMS_OUTPUT.PUT_LINE('Existencias: ' || compra."Existencias");
            DBMS_OUTPUT.PUT_LINE('Nombre Proveedor: ' || compra."Nombre Proveedor");
            DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------');
        END LOOP;
    END sp_List_Compra_DDL;

  -- Implementación del procedimiento para eliminar una compra
    PROCEDURE sp_Delete_Compra(p_IdCompra IN INT)
    AS
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