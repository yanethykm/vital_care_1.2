create or replace PROCEDURE sp_List_Usuario_DDL AS
BEGIN
    FOR UsuarioRow IN (
        SELECT 
            p.nit_cedula as "Identificacion", 
            p.nombre_razonsocial as "Nombre/Razon Social", 
            p.apellido as "Apellido", 
            p.telefono as "Telefono", 
            p.email as "Correo electronico",
            U.Usuario as "Tipo de Usuario",
            U.contraseña as "Contraseña Usuario"
    FROM Usuario U
    INNER JOIN Persona P on U.idpersona = P.id
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Identificacion: ' || UsuarioRow."Identificacion");
        DBMS_OUTPUT.PUT_LINE('Nombre/Razon Social: ' || UsuarioRow."Nombre/Razon Social");
        DBMS_OUTPUT.PUT_LINE('Apellido: ' || UsuarioRow."Apellido");
        DBMS_OUTPUT.PUT_LINE('Telefono: ' || UsuarioRow."Telefono");
        DBMS_OUTPUT.PUT_LINE('Correo electronico: ' || UsuarioRow."Correo electronico");
        DBMS_OUTPUT.PUT_LINE('Tipo de Usuario: ' || UsuarioRow."Tipo de Usuario");
        DBMS_OUTPUT.PUT_LINE('Contraseña Usuario: ' || UsuarioRow."Contraseña Usuario");
        DBMS_OUTPUT.PUT_LINE('-----------------------');
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron Usuarios.');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_List_Usuario_DDL;