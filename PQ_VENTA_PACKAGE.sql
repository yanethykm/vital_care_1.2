CREATE OR REPLACE PACKAGE pq_Venta_Package AS
  -- Procedimiento para insertar una nueva venta
  PROCEDURE sp_Insert_Venta(
    p_MontoTotal IN INT,
    p_IdCliente IN INT,
    p_IdVendedor IN INT,
    p_IdProducto IN INT,
    p_CantidadVendida IN INT);

  -- Procedimiento para insertar una nueva venta dando el total según las cantidades vendidas
  PROCEDURE sp_Insert_Venta_Total(
    p_IdCliente IN INT,
    p_IdVendedor IN INT,
    p_IdProducto IN INT,
    p_CantidadVendida IN INT);
  
  -- Procedimiento para listar todas las ventas
  PROCEDURE sp_List_Venta_DDL;

  -- Procedimiento para eliminar una venta
  PROCEDURE sp_Delete_Venta(p_IdVenta IN INT);
END pq_Venta_Package;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY pq_Venta_Package AS
  -- Implementación del procedimiento para insertar una nueva venta
    PROCEDURE sp_Insert_Venta(
        p_MontoTotal IN INT,
        p_IdCliente IN INT,
        p_IdVendedor IN INT,
        p_IdProducto IN INT,
        p_CantidadVendida IN INT
    )
    AS
    BEGIN
        DECLARE
            v_IdVenta INT;
        BEGIN
            -- Insertar la venta
            INSERT INTO Venta (Fecha, IdCliente, IdVendedor, MontoTotal) 
            VALUES (SYSDATE, p_IdCliente, p_IdVendedor, p_MontoTotal) 
            RETURNING ID INTO v_IdVenta;
    
            -- Insertar el detalle de la venta
            INSERT INTO DetalleVenta (CantidadVendida, IdProducto, IdVenta) 
            VALUES (p_CantidadVendida, p_IdProducto, v_IdVenta);
    
            -- Actualizar la cantidad del producto en la tabla Producto
            UPDATE Producto
            SET Cantidad = Cantidad - p_CantidadVendida
            WHERE Id = p_IdProducto;
    
            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        END;
    END sp_Insert_Venta;

  -- Implementación del procedimiento para insertar una nueva venta que sume el total según las cantidades vendidas
    PROCEDURE sp_Insert_Venta_Total(
        p_IdCliente IN INT,
        p_IdVendedor IN INT,
        p_IdProducto IN INT,
        p_CantidadVendida IN INT
    )
    AS
        v_PrecioVenta INT;
        v_MontoTotal INT;
        v_IdVenta INT;
    BEGIN
        -- Obtener el PrecioVenta del producto
        SELECT PrecioVenta INTO v_PrecioVenta
        FROM Producto
        WHERE Id = p_IdProducto;
    
        -- Calcular el MontoTotal
        v_MontoTotal := p_CantidadVendida * v_PrecioVenta;
    
        -- Insertar la venta
        INSERT INTO Venta (Fecha, IdCliente, IdVendedor, MontoTotal) 
        VALUES (SYSDATE, p_IdCliente, p_IdVendedor, v_MontoTotal) 
        RETURNING ID INTO v_IdVenta;
    
        -- Insertar el detalle de la venta
        INSERT INTO DetalleVenta (CantidadVendida, IdProducto, IdVenta) 
        VALUES (p_CantidadVendida, p_IdProducto, v_IdVenta);
    
        -- Actualizar la cantidad del producto en la tabla Producto
        UPDATE Producto
        SET Cantidad = Cantidad - p_CantidadVendida
        WHERE Id = p_IdProducto;
    
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            -- Manejo de errores, puedes personalizar según tus necesidades
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END sp_Insert_Venta_Total;
  
  -- Implementación del procedimiento para listar todas las ventas
    PROCEDURE sp_List_Venta_DDL
    IS
    BEGIN
        FOR ventas IN (
            SELECT 
                V.fecha AS "Fecha",
                V.MontoTotal AS "Monto Total",
                DV.CantidadVendida AS "Cantidad Vendida",
                Pr.Producto AS "Producto",
                Pr.PrecioVenta AS "Precio Venta",
                PCliente.nombre_razonsocial AS "Nombre Cliente",
                PCliente.apellido AS "Apellido Cliente",
                PCliente.telefono AS "Telefono Cliente",
                PCliente.direccion AS "Direccion Cliente",
                PCliente.email AS "Correo Cliente",
                PVendedor.nombre_razonsocial AS "Nombre Vendedor"
            FROM Venta V
                INNER JOIN DetalleVenta DV ON V.id = DV.idventa
                INNER JOIN Producto Pr ON DV.idproducto = Pr.id
                INNER JOIN Cliente C ON V.idcliente = C.id
                INNER JOIN Vendedor Ven ON V.idvendedor = Ven.id
                INNER JOIN Persona PCliente ON C.idpersona = PCliente.id
                INNER JOIN Persona PVendedor ON Ven.idpersona = PVendedor.id
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE('Fecha: ' || TO_CHAR(ventas."Fecha", 'DD-MON-YYYY HH24:MI:SS'));
            DBMS_OUTPUT.PUT_LINE('Nombre Cliente: ' || ventas."Nombre Cliente");
            DBMS_OUTPUT.PUT_LINE('Apellido Cliente: ' || ventas."Apellido Cliente");
            DBMS_OUTPUT.PUT_LINE('Telefono Cliente: ' || ventas."Telefono Cliente");
            DBMS_OUTPUT.PUT_LINE('Direccion Cliente: ' || ventas."Direccion Cliente");
            DBMS_OUTPUT.PUT_LINE('Correo Cliente: ' || ventas."Correo Cliente");
            DBMS_OUTPUT.PUT_LINE('Nombre Vendedor: ' || ventas."Nombre Vendedor");
            DBMS_OUTPUT.PUT_LINE('Producto: ' || ventas."Producto");
            DBMS_OUTPUT.PUT_LINE('Precio Venta: ' || ventas."Precio Venta");
            DBMS_OUTPUT.PUT_LINE('Cantidad Vendida: ' || ventas."Cantidad Vendida");
            DBMS_OUTPUT.PUT_LINE('Monto Total: ' || ventas."Monto Total");
            DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------');
        END LOOP;
    END sp_List_Venta_DDL;

  -- Implementación del procedimiento para eliminar una venta
    PROCEDURE sp_Delete_Venta(
        p_IdVenta IN INT
    )
    AS
    BEGIN
        DECLARE
            v_IdProducto INT;
            v_CantidadVendida INT;
        BEGIN
            -- Obtener el Id del Producto y la CantidadVendida desde DetalleVenta
            SELECT dv.IdProducto, dv.CantidadVendida
            INTO v_IdProducto, v_CantidadVendida
            FROM DetalleVenta dv
            WHERE dv.IdVenta = p_IdVenta;
    
            -- Eliminar la venta y su detalle
            DELETE FROM DetalleVenta
            WHERE IdVenta = p_IdVenta;
    
            DELETE FROM Venta
            WHERE Id = p_IdVenta;
    
            -- Actualizar la cantidad del producto en la tabla Producto
            UPDATE Producto
            SET Cantidad = Cantidad + v_CantidadVendida
            WHERE Id = v_IdProducto;
    
            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                -- Manejo de errores, puedes personalizar según tus necesidades
                ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        END;
    END sp_Delete_Venta;
END pq_Venta_Package;