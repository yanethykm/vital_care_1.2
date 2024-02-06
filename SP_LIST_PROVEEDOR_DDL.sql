CREATE OR REPLACE PROCEDURE sp_List_Proveedor_DDL (p_Cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN p_Cursor FOR
            SELECT 
                PRO.ID as "Id",
                PER.nit_cedula AS "Nit o Cédula", 
                PER.nombre_razonsocial AS "Nombre o Razon Social", 
                PER.apellido AS "Apellido", 
                PER.telefono AS "Telefono", 
                PER.email AS "Correo electronico" 
            FROM Proveedor PRO 
            INNER JOIN Persona PER ON PRO.idpersona = PER.id;
    END sp_List_Proveedor_DDL;