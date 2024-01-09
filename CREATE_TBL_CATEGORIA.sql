------------------------------------------/
--------- TABLA CATEGORIA ----------------/
------------------------------------------/
CREATE TABLE Categoria (
    ID INT PRIMARY KEY,
    Categoria VARCHAR(255) NOT NULL
);

------------------------------------------------------------/
----- SECUENCIA PARA EL AUTOINCREMENTABLE ID VENDEDOR -----/
------------------------------------------------------------/
CREATE SEQUENCE Categoria_ID_Seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

-------- DISPARADOR PARA EL AUTOINCREMENTABLE -----/
CREATE OR REPLACE TRIGGER Categoria_BI_TRG
BEFORE INSERT ON Categoria
FOR EACH ROW
BEGIN
  SELECT Categoria_ID_Seq.NEXTVAL
  INTO :NEW.ID
  FROM dual;
END;