------------------------------------------/
--------- TABLA DEVOLUCION ---------------/
------------------------------------------/
CREATE TABLE Devolucion (
    ID INT PRIMARY KEY,
    FechaDevolucion DATE NOT NULL,
    CantidadDevuelta INT,
    RazonDevolucion VARCHAR(255),
    IdVenta INT,
    FOREIGN KEY (IdVenta) REFERENCES Venta(ID)
);

------------------------------------------------------------/
----- SECUENCIA PARA EL AUTOINCREMENTABLE ID DEVOLUCION ----/
------------------------------------------------------------/
CREATE SEQUENCE Devolucion_ID_Seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

-------- DISPARADOR PARA EL AUTOINCREMENTABLE -----/
CREATE OR REPLACE TRIGGER Devolucion_BI_TRG
BEFORE INSERT ON Devolucion
FOR EACH ROW
BEGIN
  SELECT Devolucion_ID_Seq.NEXTVAL
  INTO :NEW.ID
  FROM dual;
END;