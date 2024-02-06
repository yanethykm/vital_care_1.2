--------------------------------------------------------
----------- PROCEDIMIENTO ALMACENADO INSERT ------------
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Insert_Cliente(p_Cursor OUT SYS_REFCURSOR, p_IdPersona IN INT) AS
    BEGIN
        INSERT INTO Cliente (IdPersona)
        VALUES (p_IdPersona);
        
        OPEN p_Cursor FOR
            SELECT * FROM Cliente WHERE IdPersona = p_IdPersona;
    
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
END sp_Insert_Cliente;

--------------------------------------------------------
----------- PROCEDIMIENTO ALMACENADO DELETE ------------
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Delete_Cliente(p_Cursor OUT SYS_REFCURSOR, p_IDCliente IN INT) AS
    BEGIN

        OPEN p_Cursor FOR
            SELECT * FROM Cliente WHERE ID = p_IDCliente;
    
        DELETE FROM Cliente
        WHERE ID = p_IDCliente;
    
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
END sp_Delete_Cliente;

-------------------------------------------------------------------------------
--------------- PROCEDIMIENTO ALMACENADO UPDATE -------------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Update_Cliente(p_Cursor OUT SYS_REFCURSOR, p_IDCliente IN INT, p_IdPersona IN INT) AS
    BEGIN

        UPDATE Cliente
        SET IdPersona = p_IdPersona
        WHERE ID = p_IDCliente;

        OPEN p_Cursor FOR
            SELECT * FROM Cliente WHERE ID = p_IDCliente;
    
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_Update_Cliente;

-------------------------------------------------------------------------------
--------------- PROCEDIMIENTO ALMACENADO LIST ---------------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_List_Cliente_DDL (p_Cursor OUT SYS_REFCURSOR)AS
    BEGIN
        Open p_Cursor FOR
            SELECT 
                p.id,
                P.nit_cedula as "Identificacion", 
                P.nombre_razonsocial as "Nombre/Razon Social", 
                P.apellido as "Apellido", 
                P.telefono as "Telefono", 
                P.email as "Correo electronico"
        FROM Cliente C
        INNER JOIN Persona P on C.idpersona = P.id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontraron Clientes.');
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
END sp_List_Cliente_DDL;