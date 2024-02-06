CREATE OR REPLACE PROCEDURE sp_List_Venta_DDL (p_Cursor OUT SYS_REFCURSOR)
    IS
    BEGIN
        OPEN p_Cursor FOR
            SELECT 
                V.ID,
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
                INNER JOIN Persona PVendedor ON Ven.idpersona = PVendedor.id;
    END sp_List_Venta_DDL;
