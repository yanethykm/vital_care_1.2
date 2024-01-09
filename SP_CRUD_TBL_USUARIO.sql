--------------------------------------------------------------------------------
------------------ PROCEDIMIENTO ALMACENADO INSERTAR ---------------------------
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Insert_Usuario (
    p_Usuario VARCHAR,
    p_Contraseņa VARCHAR,
    p_IdPersona INT
) AS
BEGIN
    INSERT INTO Usuario (Usuario, Contraseņa, IdPersona)
    VALUES (p_Usuario, p_Contraseņa, p_IdPersona);

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Insert_Usuario;

--------------------------------------------------------------------------------
------------------ PROCEDIMIENTO ALMACENADO UPDATE -----------------------------
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Update_Usuario (
    p_IdUsuario INT,
    p_Usuario VARCHAR,
    p_Contraseņa VARCHAR,
    p_IdPersona INT
) AS
BEGIN
    UPDATE Usuario
    SET Usuario = p_Usuario,
        Contraseņa = p_Contraseņa,
        IdPersona = p_IdPersona
    WHERE ID = p_IdUsuario;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK; 
        RAISE;
END sp_Update_Usuario;

--------------------------------------------------------------------------------
------------------ PROCEDIMIENTO ALMACENADO LISTAR -----------------------------
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_List_Usuario AS
BEGIN
    FOR UsuarioRow IN ( SELECT Usuario, Contraseņa, IdPersona FROM Usuario ) LOOP
        DBMS_OUTPUT.PUT_LINE( 
            ' | Usuario: ' || UsuarioRow.Usuario ||
            ' | Contraseņa: ' || UsuarioRow.Contraseņa ||
            ' | IdPersona: ' || UsuarioRow.IdPersona
        );
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron usuarios.');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_List_Usuario;

--------------------------------------------------------------------------------
------------------ PROCEDIMIENTO ALMACENADO DELETE -----------------------------
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Delete_Usuario (
    p_IdUsuario INT
) AS
BEGIN
    DELETE FROM Usuario
    WHERE ID = p_IdUsuario;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Delete_Usuario;
