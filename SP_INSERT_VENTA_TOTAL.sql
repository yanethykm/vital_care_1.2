CREATE OR REPLACE PROCEDURE sp_Insert_Venta_Total(
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
    INSERT INTO Venta (
        Fecha,
        IdCliente,
        IdVendedor,
        MontoTotal
    ) VALUES (
        SYSDATE,
        p_IdCliente,
        p_IdVendedor,
        v_MontoTotal
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
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END sp_Insert_Venta_Total;
