------------------------------------------/
--------- TABLA DETALLE COMPRA -----------/
------------------------------------------/
CREATE TABLE DetalleCompra (
    ID INT PRIMARY KEY,
    CantidadComprada INT,
    PrecioUnitario INT,
    IdProducto INT,
    FOREIGN KEY (IdProducto) REFERENCES Producto(ID),
    IdCompra INT,
    FOREIGN KEY (IdCompra) REFERENCES Compra(ID)
);

------------------------------------------------------------/
---- SECUENCIA PARA EL AUTOINCREMENTABLE ID DETALLE COMPRA -/
------------------------------------------------------------/
CREATE SEQUENCE DetalleCompra_ID_Seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

-------- DISPARADOR PARA EL AUTOINCREMENTABLE -----/
CREATE OR REPLACE TRIGGER DetalleCompra_BI_TRG
BEFORE INSERT ON DetalleCompra
FOR EACH ROW
BEGIN
  SELECT DetalleCompra_ID_Seq.NEXTVAL
  INTO :NEW.ID
  FROM dual;
END;