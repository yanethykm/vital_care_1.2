--------------------------------------------------------
----------- PROCEDIMIENTO ALMACENADO INSERT ------------
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Insert_Venta(
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
        INSERT INTO Venta (
            Fecha,
            IdCliente,
            IdVendedor,
            MontoTotal
        ) VALUES (
            SYSDATE,
            p_IdCliente,
            p_IdVendedor,
            p_MontoTotal
        ) RETURNING ID INTO v_IdVenta;

        -- Insertar el detalle de la venta
        INSERT INTO DetalleVenta (
            CantidadVendida,
            IdProducto,
            IdVenta
        ) VALUES (
            p_CantidadVendida,
            p_IdProducto,
            v_IdVenta
        );

        -- Actualizar la cantidad del producto en la tabla Producto
        UPDATE Producto
        SET Cantidad = Cantidad - p_CantidadVendida
        WHERE Id = p_IdProducto;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            -- Manejo de errores, puedes personalizar según tus necesidades
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Error: No se pudo Crear la Venta' || SQLERRM);
    END;
END sp_Insert_Venta;

--------------------------------------------------------
----------- PROCEDIMIENTO ALMACENADO DELETE ------------
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Delete_Venta(
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
            DBMS_OUTPUT.PUT_LINE('Error: No se pudo eliminar la venta' || SQLERRM);
    END;
END sp_Delete_Venta;

-------------------------------------------------------------------------------
---------------PROCEDIMIENTO ALMACENADO LIST ----------------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_List_Venta_DDL
IS
BEGIN
    FOR rec IN (
        SELECT 
            V.Fecha,
            V.MontoTotal AS "Monto Total",
            PCliente.nombre_razonsocial AS "Nombre Cliente",
            PCliente.apellido AS "Apellido Cliente",
            PCliente.telefono AS "Telefono Cliente",
            PCliente.direccion AS "Direccion Cliente",
            PCliente.email AS "Correo Cliente",
            PVendedor.nombre_razonsocial AS "Nombre Vendedor"
        FROM Venta V
        INNER JOIN Cliente C ON V.IdCliente = C.Id
        INNER JOIN Vendedor Vd ON V.IdVendedor = Vd.Id 
        INNER JOIN Persona PCliente ON C.IdPersona = PCliente.Id
        INNER JOIN Persona PVendedor ON Vd.IdPersona = PVendedor.Id
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('Fecha: ' || TO_CHAR(rec.Fecha, 'DD-MON-YYYY HH24:MI:SS'));
        DBMS_OUTPUT.PUT_LINE('Monto Total: ' || rec."Monto Total");
        DBMS_OUTPUT.PUT_LINE('Nombre Cliente: ' || rec."Nombre Cliente");
        DBMS_OUTPUT.PUT_LINE('Apellido Cliente: ' || rec."Apellido Cliente");
        DBMS_OUTPUT.PUT_LINE('Telefono Cliente: ' || rec."Telefono Cliente");
        DBMS_OUTPUT.PUT_LINE('Direccion Cliente: ' || rec."Direccion Cliente");
        DBMS_OUTPUT.PUT_LINE('Correo Cliente: ' || rec."Correo Cliente");
        DBMS_OUTPUT.PUT_LINE('Nombre Vendedor: ' || rec."Nombre Vendedor");
        DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------');
    END LOOP;
END sp_List_Venta_DDL;