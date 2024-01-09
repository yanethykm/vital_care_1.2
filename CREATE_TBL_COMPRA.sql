------------------------------------------/
--------- TABLA COMPRA ----------------/
------------------------------------------/
CREATE TABLE Compra (
    ID INT PRIMARY KEY,
    NumeroFactura VARCHAR2(255) NOT NULL,
    FechaCompra DATE,
    MontoTotal DECIMAL(10, 2),
    IdProveedor INT,
    FOREIGN KEY (IdProveedor) REFERENCES Proveedor(ID)
);

------------------------------------------------------------/
----- SECUENCIA PARA EL AUTOINCREMENTABLE ID COMPRA -----/
------------------------------------------------------------/
CREATE SEQUENCE Compra_ID_Seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

-------- DISPARADOR PARA EL AUTOINCREMENTABLE -----/
CREATE OR REPLACE TRIGGER Compra_BI_TG
BEFORE INSERT ON Compra
FOR EACH ROW
BEGIN
    SELECT Compra_ID_Seq.NEXTVAL 
    INTO :NEW.ID 
    FROM DUAL;
END;