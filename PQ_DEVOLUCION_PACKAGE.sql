CREATE OR REPLACE PACKAGE pq_Devolucion_Package AS
  -- Procedimiento para insertar una nueva devolucion
  PROCEDURE sp_Insert_Devolucion(
    p_FechaDevolucion IN DATE,
    p_CantidadDevuelta IN INT,
    p_RazonDevolucion IN VARCHAR,
    p_IdVenta IN INT);

  -- Procedimiento para listar todas las devoluciones
  PROCEDURE sp_List_Devolucion_DDL;
END pq_Devolucion_Package;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY pq_Devolucion_Package AS
  -- Implementación del procedimiento para insertar una nueva devolucion
    PROCEDURE sp_Insert_Devolucion(
        p_FechaDevolucion IN DATE,
        p_CantidadDevuelta IN INT,
        p_RazonDevolucion IN VARCHAR,
        p_IdVenta IN INT
    )
    AS
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
    
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Error: No se pudo insertar la devolucion' || SQLERRM);
    END sp_Insert_Devolucion;

  -- Implementación del procedimiento para listar todas las devoluciones
    PROCEDURE sp_List_Devolucion_DDL AS
    BEGIN
        FOR devolucion IN (
            SELECT 
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
            INNER JOIN Producto P ON DV.IdProducto = P.ID
        ) LOOP
            DBMS_OUTPUT.PUT_LINE('Fecha de Devolucion: ' || devolucion."Fecha de Devolucion");
            DBMS_OUTPUT.PUT_LINE('Cantidad Devuelta: ' || devolucion."Cantidad Devuelta");
            DBMS_OUTPUT.PUT_LINE('Razon de Devolucion: ' || devolucion."Razon de Devolucion");
            DBMS_OUTPUT.PUT_LINE('Fecha de Venta: ' || devolucion."Fecha de Venta");
            DBMS_OUTPUT.PUT_LINE('Nombre Cliente: ' || devolucion."Nombre Cliente");
            DBMS_OUTPUT.PUT_LINE('Nombre Vendedor: ' || devolucion."Nombre Vendedor");
            DBMS_OUTPUT.PUT_LINE('Cantidad Vendida: ' || devolucion."Cantidad Vendida");
            DBMS_OUTPUT.PUT_LINE('Producto: ' || devolucion."Producto");
            DBMS_OUTPUT.PUT_LINE('Descripcion: ' || devolucion."Descripcion");
            DBMS_OUTPUT.PUT_LINE('Precio de Venta: ' || devolucion."Precio de Venta");
            DBMS_OUTPUT.PUT_LINE('------------------------');
        END LOOP;
    END sp_List_Devolucion_DDL;
END pq_Devolucion_Package;


