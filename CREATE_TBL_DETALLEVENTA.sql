------------------------------------------/
--------- TABLA DETALLE VENTA ----------------/
------------------------------------------/
CREATE TABLE DetalleVenta (
    ID INT PRIMARY KEY,
    CantidadVendida INT,
    IdProducto INT,
    FOREIGN KEY (IdProducto) REFERENCES Producto(ID),
    IdVenta INT,
    FOREIGN KEY (IdVenta) REFERENCES Venta(ID)
);

------------------------------------------------------------/
----- SECUENCIA PARA EL AUTOINCREMENTABLE ID DETALLE VENTA -----/
------------------------------------------------------------/
CREATE SEQUENCE DetalleVenta_ID_Seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

-------- DISPARADOR PARA EL AUTOINCREMENTABLE -----/
CREATE OR REPLACE TRIGGER DetalleVenta_BI_TRG
BEFORE INSERT ON DetalleVenta
FOR EACH ROW
BEGIN
  SELECT DetalleVenta_ID_Seq.NEXTVAL
  INTO :NEW.ID
  FROM dual;
END;