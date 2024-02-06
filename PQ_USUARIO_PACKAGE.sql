CREATE OR REPLACE PACKAGE pq_Usuario_Package AS
  -- Procedimiento para insertar un nuevo usuario
  PROCEDURE sp_Insert_Usuario (
        p_Cursor OUT SYS_REFCURSOR,
        p_Usuario VARCHAR,
        p_Clave VARCHAR,
        p_IdPersona INT);

  -- Procedimiento para listar todos los usuarios
  PROCEDURE sp_List_Usuario_DDL (p_Cursor OUT SYS_REFCURSOR);

  -- Procedimiento para actualizar un usuario
  PROCEDURE sp_Update_Usuario (
        p_Cursor OUT SYS_REFCURSOR,
        p_IdUsuario INT,
        p_Usuario VARCHAR,
        p_Clave VARCHAR,
        p_IdPersona INT);

  -- Procedimiento para eliminar un usuario
  PROCEDURE sp_Delete_Usuario (p_Cursor OUT SYS_REFCURSOR, p_IdUsuario INT);
END pq_Usuario_Package;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY pq_Usuario_Package AS
  -- Implementación del procedimiento para insertar un nuevo usuario
    PROCEDURE sp_Insert_Usuario (
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

  -- Implementación del procedimiento para listar todos los usuarios
    PROCEDURE sp_List_Usuario_DDL (p_Cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN p_Cursor FOR
            SELECT 
                u.id,
                p.nit_cedula as "Identificacion", 
                p.nombre_razonsocial as "Nombre/Razon Social", 
                p.apellido as "Apellido", 
                p.telefono as "Telefono", 
                p.email as "Correo electronico",
                U.Usuario as "Tipo de Usuario",
                u.clave as "Contraseña Usuario"
        FROM Usuario U
        INNER JOIN Persona P on U.idpersona = P.id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontraron Usuarios.');
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_List_Usuario_DDL;

  -- Implementación del procedimiento para actualizar un usuario
    PROCEDURE sp_Update_Usuario (
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

  -- Implementación del procedimiento para eliminar un usuario
    PROCEDURE sp_Delete_Usuario (
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
END pq_Usuario_Package;