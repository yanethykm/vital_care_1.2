---------------------------------/
--- TABLA PERSONA ---------------/
---------------------------------/
CREATE TABLE Persona (
    ID INT PRIMARY KEY,
    Nit_Cedula INT NOT NULL,
    Nombre_RazonSocial VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(10),
    Email VARCHAR(255),
    Ciudad VARCHAR(50),
    TipoDocumento VARCHAR(20)
);
----- SECUENCIA PARA EL AUTOINCREMENTABLE ID ---/
CREATE SEQUENCE Persona_ID_Seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE;
-------- DISPARADOR PARA EL AUTOINCREMENTABLE -----/
CREATE OR REPLACE TRIGGER Persona_BI_TRG
BEFORE INSERT ON Persona
FOR EACH ROW
BEGIN
  SELECT Persona_ID_Seq.NEXTVAL
  INTO :NEW.ID
  FROM dual;
END;
