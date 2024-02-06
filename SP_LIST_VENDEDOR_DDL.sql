create or replace PROCEDURE sp_List_Vendedor_DDL (p_Cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN p_Cursor FOR
            SELECT 
            V.ID,
            P.nit_cedula as "Identificacion", 
            P.nombre_razonsocial as "Nombre/Razon Social", 
            P.apellido as "Apellido", 
            P.telefono as "Telefono", 
            P.email as "Correo electronico"
        FROM Vendedor V
        INNER JOIN Persona P on V.idpersona = P.ID;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontraron Vendedores.');
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_List_Vendedor_DDL;