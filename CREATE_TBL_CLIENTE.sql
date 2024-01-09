------------------------------------------/
--------- TABLA CLIENTE ----------------/
------------------------------------------/
CREATE TABLE Cliente (
    ID INT PRIMARY KEY,
    IdPersona INT,
    FOREIGN KEY (IdPersona) REFERENCES Persona(ID)
);

------------------------------------------------------------/
----- SECUENCIA PARA EL AUTOINCREMENTABLE ID CLIENTE -----/
------------------------------------------------------------/
CREATE SEQUENCE Cliente_ID_Seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

-------- DISPARADOR PARA EL AUTOINCREMENTABLE -----/
CREATE OR REPLACE TRIGGER Cliente_BI_TRG
BEFORE INSERT ON Cliente
FOR EACH ROW
BEGIN
  SELECT Cliente_ID_Seq.NEXTVAL
  INTO :NEW.ID
  FROM dual;
END;