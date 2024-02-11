CREATE OR REPLACE FUNCTION fn_CalcularTotal_Compra(p_cantidad INT, p_precio_unitario INT) RETURN INT
AS
  v_monto_total INT;
BEGIN
  v_monto_total := p_cantidad * p_precio_unitario;
  RETURN v_monto_total;
END fn_CalcularTotal_Compra;
