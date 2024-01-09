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