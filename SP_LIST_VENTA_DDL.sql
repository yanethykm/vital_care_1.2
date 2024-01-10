CREATE OR REPLACE PROCEDURE sp_List_Venta_DDL
IS
BEGIN
    FOR rec IN (
        SELECT 
            V.Fecha AS "Fecha",
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
        INNER JOIN DetalleVenta DV ON V.id = DV.idventa  -- Corrección en el alias DVenta
        INNER JOIN Producto Pr ON DV.idproducto = Pr.id   -- Corrección en el alias DVenta
        INNER JOIN Cliente C ON V.idcliente = C.id
        INNER JOIN Vendedor Ven ON V.idvendedor = Ven.id
        INNER JOIN Persona PCliente ON C.idpersona = PCliente.id
        INNER JOIN Persona PVendedor ON Ven.idpersona = PVendedor.id

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