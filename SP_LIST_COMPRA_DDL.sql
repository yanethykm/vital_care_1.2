create or replace PROCEDURE sp_List_Compra_DDL
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