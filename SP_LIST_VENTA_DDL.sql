CREATE OR REPLACE PROCEDURE sp_List_Venta_DDL
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
