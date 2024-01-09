------------------------------------------/
--------- TABLA USUARIO ----------------/
------------------------------------------/
CREATE TABLE Usuario (
    ID INT PRIMARY KEY,
    Usuario VARCHAR(255),
    Contraseña VARCHAR(40),
    IdPersona INT,
    FOREIGN KEY (IdPersona) REFERENCES Persona(ID)
);

------------------------------------------------------------/
----- SECUENCIA PARA EL AUTOINCREMENTABLE ID USUARIO -----/
------------------------------------------------------------/
CREATE SEQUENCE Usuario_ID_Seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

-------- DISPARADOR PARA EL AUTOINCREMENTABLE -----/
CREATE OR REPLACE TRIGGER Usuario_BI_TRG
BEFORE INSERT ON Usuario
FOR EACH ROW
BEGIN
  SELECT Usuario_ID_Seq.NEXTVAL
  INTO :NEW.ID
  FROM dual;
END;