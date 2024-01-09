------------------------------------------/
--------- TABLA VENTA ----------------/
------------------------------------------/
CREATE TABLE Venta (
    ID INT PRIMARY KEY,
    Fecha DATE NOT NULL,
    IdCliente INT,
    FOREIGN KEY (IdCliente) REFERENCES Cliente(ID),
    IdVendedor INT,
    FOREIGN KEY (IdVendedor) REFERENCES Vendedor(ID)
);

------------------------------------------------------------/
----- SECUENCIA PARA EL AUTOINCREMENTABLE ID VENTA -----/
------------------------------------------------------------/
CREATE SEQUENCE Venta_ID_Seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

-------- DISPARADOR PARA EL AUTOINCREMENTABLE -----/
CREATE OR REPLACE TRIGGER Venta_BI_TRG
BEFORE INSERT ON Venta
FOR EACH ROW
BEGIN
  SELECT Venta_ID_Seq.NEXTVAL
  INTO :NEW.ID
  FROM dual;
END;