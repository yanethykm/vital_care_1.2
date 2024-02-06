create or replace PROCEDURE sp_List_Usuario_DDL (p_Cursor OUT SYS_REFCURSOR) AS
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