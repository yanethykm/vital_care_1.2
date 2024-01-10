CREATE OR REPLACE PROCEDURE sp_List_Producto_DDL
AS
BEGIN
    FOR producto IN (
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
        INNER JOIN Persona pv ON pr.idpersona = pv.id
    ) LOOP
        -- Imprimir o procesar cada fila según sea necesario
        DBMS_OUTPUT.PUT_LINE(
            'Codigo Producto: ' || producto."Codigo Producto" ||
            ', Producto: ' || producto."Producto" ||
            ', Descripcion: ' || producto."Descripcion" ||
            ', Precio de Venta: ' || producto."Precio de Venta" ||
            ', Cantidad Minima: ' || producto."Cantidad Minima" ||
            ', Cantidad Existente: ' || producto."Cantidad Existente" ||
            ', Categoria: ' || producto."Categoria" ||
            ', Nombre del Proveedor: ' || producto."Nombre del Proveedor" ||
            ', Apellido del Proveedor: ' || producto."Apellido del Proveedor"
        );
    END LOOP;
END sp_List_Producto_DDL;