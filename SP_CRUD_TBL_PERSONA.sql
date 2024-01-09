--------------------------------------------------------
----------- PROCEDIMIENTO ALMACENADO INSERT ------------
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Insert_Persona (
    p_NitCedula IN INT,
    p_NombreRazonSocial IN VARCHAR,
    p_Apellido IN VARCHAR,
    p_Direccion IN VARCHAR,
    p_Telefono IN VARCHAR,
    p_Email IN VARCHAR,
    p_TipoDocumento IN VARCHAR
) AS
BEGIN
    INSERT INTO Persona (Nit_Cedula, Nombre_RazonSocial, Apellido, Direccion, Telefono, Email, TipoDocumento)
    VALUES (p_NitCedula, p_NombreRazonSocial, p_Apellido, p_Direccion, p_Telefono, p_Email, p_TipoDocumento);
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Insert_Persona;


------------------------------------------------------------------------------
--------- PROCEDIMIENTO ALMACENADO DELETE ------------------------------------
------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Delete_Persona (
    p_ID IN INT
) AS
BEGIN
    DELETE FROM Persona
    WHERE ID = p_ID;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Delete_Persona;


-------------------------------------------------------------------------------
--------------- PROCEDIMIENTO ALMACENADO UPDATE -------------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Update_Persona (
    p_ID IN INT,
    p_NitCedula IN VARCHAR,
    p_NombreRazonSocial IN VARCHAR,
    p_Apellido IN VARCHAR,
    p_Direccion IN VARCHAR,
    p_Telefono IN VARCHAR,
    p_Email IN VARCHAR,
    p_TipoDocumento IN VARCHAR
) AS
BEGIN
    UPDATE Persona
    SET
        Nit_Cedula = p_NitCedula,
        Nombre_RazonSocial = p_NombreRazonSocial,
        Apellido = p_Apellido,
        Direccion = p_Direccion,
        Telefono = p_Telefono,
        Email = p_Email,
        TipoDocumento = p_TipoDocumento
    WHERE ID = p_ID;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Update_Persona;

-------------------------------------------------------------------------------
--------------- PROCEDIMIENTO ALMACENADO READ ---------------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_List_Persona AS
BEGIN
    FOR persona IN (SELECT Nit_Cedula, Nombre_RazonSocial, Apellido, Direccion, Telefono, Email, TipoDocumento FROM Persona) LOOP
        DBMS_OUTPUT.PUT_LINE('Nit_Cedula: ' || persona.Nit_Cedula);
        DBMS_OUTPUT.PUT_LINE('Nombre_RazonSocial: ' || persona.Nombre_RazonSocial);
        DBMS_OUTPUT.PUT_LINE('Apellido: ' || persona.Apellido);
        DBMS_OUTPUT.PUT_LINE('Direccion: ' || persona.Direccion);
        DBMS_OUTPUT.PUT_LINE('Telefono: ' || persona.Telefono);
        DBMS_OUTPUT.PUT_LINE('Email: ' || persona.Email);
        DBMS_OUTPUT.PUT_LINE('TipoDocumento: ' || persona.TipoDocumento);
        DBMS_OUTPUT.NEW_LINE;
    END LOOP;
END sp_List_Persona;