--------------------------------------------------------------------------------
------------------ PROCEDIMIENTO ALMACENADO INSERTAR ---------------------------
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Insert_Usuario (
        p_Cursor OUT SYS_REFCURSOR,
        p_Usuario VARCHAR,
        p_Clave VARCHAR,
        p_IdPersona INT
    ) AS
    BEGIN
        INSERT INTO Usuario (Usuario, Clave, IdPersona)
        VALUES (p_Usuario, p_Clave, p_IdPersona);
    
        -- Asignar el cursor de salida
        OPEN p_Cursor FOR
            SELECT * FROM Usuario WHERE Usuario = p_Usuario;
        
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
        p_Cursor OUT SYS_REFCURSOR,
        p_IdUsuario INT,
        p_Usuario VARCHAR,
        p_Clave VARCHAR,
        p_IdPersona INT
    ) AS
    BEGIN
        UPDATE Usuario
        SET Usuario = p_Usuario,
            Clave = p_Clave,
            IdPersona = p_IdPersona
        WHERE ID = p_IdUsuario;
        
        OPEN p_Cursor FOR
        SELECT * FROM Usuario WHERE ID = p_IdUsuario;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; 
            RAISE;
    END sp_Update_Usuario;

--------------------------------------------------------------------------------
------------------ PROCEDIMIENTO ALMACENADO DELETE -----------------------------
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Delete_Usuario (
        p_Cursor OUT SYS_REFCURSOR,
        p_IdUsuario INT
    ) AS
    BEGIN
        -- Seleccionar datos antes de la eliminación
        OPEN p_Cursor FOR
            SELECT * FROM Usuario WHERE ID = p_IdUsuario;
    
        -- Eliminar el usuario
        DELETE FROM Usuario
        WHERE ID = p_IdUsuario;
    
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_Delete_Usuario;
