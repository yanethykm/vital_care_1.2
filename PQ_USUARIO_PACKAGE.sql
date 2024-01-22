CREATE OR REPLACE PACKAGE pq_Usuario_Package AS
  -- Procedimiento para insertar un nuevo usuario
  PROCEDURE sp_Insert_Usuario (
    p_Usuario VARCHAR,
    p_Contrase�a VARCHAR,
    p_IdPersona INT);

  -- Procedimiento para listar todos los usuarios
  PROCEDURE sp_List_Usuario_DDL;

  -- Procedimiento para actualizar un usuario
  PROCEDURE sp_Update_Usuario (
    p_IdUsuario INT,
    p_Usuario VARCHAR,
    p_Contrase�a VARCHAR,
    p_IdPersona INT);

  -- Procedimiento para eliminar un usuario
  PROCEDURE sp_Delete_Usuario (p_IdUsuario INT);
END pq_Usuario_Package;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY pq_Usuario_Package AS
  -- Implementaci�n del procedimiento para insertar un nuevo usuario
    PROCEDURE sp_Insert_Usuario (
        p_Usuario VARCHAR,
        p_Contrase�a VARCHAR,
        p_IdPersona INT
    ) AS
    BEGIN
        INSERT INTO Usuario (Usuario, Contrase�a, IdPersona)
        VALUES (p_Usuario, p_Contrase�a, p_IdPersona);
    
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_Insert_Usuario;

  -- Implementaci�n del procedimiento para listar todos los usuarios
    PROCEDURE sp_List_Usuario_DDL AS
    BEGIN
        FOR UsuarioRow IN (
            SELECT 
                p.nit_cedula as "Identificacion", 
                p.nombre_razonsocial as "Nombre/Razon Social", 
                p.apellido as "Apellido", 
                p.telefono as "Telefono", 
                p.email as "Correo electronico",
                U.Usuario as "Tipo de Usuario",
                U.contrase�a as "Contrase�a Usuario"
        FROM Usuario U
        INNER JOIN Persona P on U.idpersona = P.id
        ) LOOP
            DBMS_OUTPUT.PUT_LINE('Identificacion: ' || UsuarioRow."Identificacion");
            DBMS_OUTPUT.PUT_LINE('Nombre/Razon Social: ' || UsuarioRow."Nombre/Razon Social");
            DBMS_OUTPUT.PUT_LINE('Apellido: ' || UsuarioRow."Apellido");
            DBMS_OUTPUT.PUT_LINE('Telefono: ' || UsuarioRow."Telefono");
            DBMS_OUTPUT.PUT_LINE('Correo electronico: ' || UsuarioRow."Correo electronico");
            DBMS_OUTPUT.PUT_LINE('Tipo de Usuario: ' || UsuarioRow."Tipo de Usuario");
            DBMS_OUTPUT.PUT_LINE('Contrase�a Usuario: ' || UsuarioRow."Contrase�a Usuario");
            DBMS_OUTPUT.PUT_LINE('-----------------------');
        END LOOP;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontraron Usuarios.');
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_List_Usuario_DDL;

  -- Implementaci�n del procedimiento para actualizar un usuario
    PROCEDURE sp_Update_Usuario (
        p_IdUsuario INT,
        p_Usuario VARCHAR,
        p_Contrase�a VARCHAR,
        p_IdPersona INT
    ) AS
    BEGIN
        UPDATE Usuario
        SET Usuario = p_Usuario,
            Contrase�a = p_Contrase�a,
            IdPersona = p_IdPersona
        WHERE ID = p_IdUsuario;
    
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK; 
            RAISE;
    END sp_Update_Usuario;

  -- Implementaci�n del procedimiento para eliminar un usuario
    PROCEDURE sp_Delete_Usuario (p_IdUsuario INT) AS
    BEGIN
        DELETE FROM Usuario
        WHERE ID = p_IdUsuario;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_Delete_Usuario;
END pq_Usuario_Package;