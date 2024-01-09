------------------------------------------/
--------- TABLA PROVEEDOR ----------------/
------------------------------------------/
CREATE TABLE Proveedor (
    ID INT PRIMARY KEY,
    IdPersona INT,
    FOREIGN KEY (IdPersona) REFERENCES Persona(ID)
);

------------------------------------------------------------/
----- SECUENCIA PARA EL AUTOINCREMENTABLE ID PROVEEDOR -----/
------------------------------------------------------------/
CREATE SEQUENCE Proveedor_ID_Seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

-------- DISPARADOR PARA EL AUTOINCREMENTABLE -----/
CREATE OR REPLACE TRIGGER Proveedor_BI_TRG
BEFORE INSERT ON Proveedor
FOR EACH ROW
BEGIN
  SELECT Proveedor_ID_Seq.NEXTVAL
  INTO :NEW.ID
  FROM dual;
END;