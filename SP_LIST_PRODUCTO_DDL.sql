CREATE OR REPLACE PROCEDURE sp_List_Producto_DDL (p_Cursor OUT SYS_REFCURSOR)
    AS
    BEGIN
        OPEN p_Cursor FOR
            SELECT
                p.id AS "Codigo Producto",
                p.producto AS "Producto",
                p.descripcion AS "Descripcion",
                p.precioventa AS "Precio de Venta",
                p.cantidadminima AS "Cantidad Minima",
                p.cantidad AS "Cantidad Existente",
                c.categoria AS "Categoria",
                pv.nombre_razonsocial AS "Nombre del Proveedor",
                pv.apellido AS "Apellido del Proveedor"
            FROM Producto p
            INNER JOIN Categoria c ON p.idcategoria = c.id
            INNER JOIN Proveedor pr ON p.idproveedor = pr.id
            INNER JOIN Persona pv ON pr.idpersona = pv.id;
    END sp_List_Producto_DDL;