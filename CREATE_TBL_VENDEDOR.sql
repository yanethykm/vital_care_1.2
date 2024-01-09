------------------------------------------/
--------- TABLA VENDEDOR ----------------/
------------------------------------------/
CREATE TABLE Vendedor (
    ID INT PRIMARY KEY,
    IdPersona INT,
    FOREIGN KEY (IdPersona) REFERENCES Persona(ID)
);

------------------------------------------------------------/
----- SECUENCIA PARA EL AUTOINCREMENTABLE ID VENDEDOR -----/
------------------------------------------------------------/
CREATE SEQUENCE Vendedor_ID_Seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

-------- DISPARADOR PARA EL AUTOINCREMENTABLE -----/
CREATE OR REPLACE TRIGGER Vendedor_BI_TRG
BEFORE INSERT ON Vendedor
FOR EACH ROW
BEGIN
  SELECT Vendedor_ID_Seq.NEXTVAL
  INTO :NEW.ID
  FROM dual;
END;