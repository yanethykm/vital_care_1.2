create or replace PROCEDURE sp_List_Compra_DDL (p_Cursor OUT SYS_REFCURSOR)
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