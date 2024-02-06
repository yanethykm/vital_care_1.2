CREATE OR REPLACE PACKAGE pq_Vendedor_Package AS
  -- Procedimiento para insertar un nuevo vendedor
  PROCEDURE sp_Insert_Vendedor (p_Cursor OUT SYS_REFCURSOR, p_IdPersona IN INT);

  -- Procedimiento para listar todos los vendedores
  PROCEDURE sp_List_Vendedor_DDL (p_Cursor OUT SYS_REFCURSOR);

  -- Procedimiento para actualizar un vendedor
  PROCEDURE sp_Update_Vendedor (
        p_Cursor OUT SYS_REFCURSOR,
        p_ID IN INT,
        p_IdPersona IN INT);

  -- Procedimiento para eliminar un vendedor
  PROCEDURE sp_Delete_Vendedor (p_Cursor OUT SYS_REFCURSOR, p_ID IN INT);
END pq_Vendedor_Package;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY pq_Vendedor_Package AS
  -- Implementación del procedimiento para insertar un nuevo vendedor
    PROCEDURE sp_Insert_Vendedor (
        p_Cursor OUT SYS_REFCURSOR,
        p_IdPersona IN INT
    ) AS
    BEGIN
        INSERT INTO Vendedor (IdPersona)
        VALUES (p_IdPersona);
    
        -- Asignar el cursor de salida
        OPEN p_Cursor FOR
            SELECT * FROM Vendedor WHERE IdPersona = p_IdPersona;
    
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_Insert_Vendedor;

  -- Implementación del procedimiento para listar todos los vendedores
    PROCEDURE sp_List_Vendedor_DDL (p_Cursor OUT SYS_REFCURSOR) AS
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

  -- Implementación del procedimiento para actualizar un vendedor
    PROCEDURE sp_Update_Vendedor (
        p_Cursor OUT SYS_REFCURSOR,
        p_ID IN INT,
        p_IdPersona IN INT
    ) AS
    BEGIN
        UPDATE Vendedor
        SET IdPersona = p_IdPersona
        WHERE id = p_ID;
        
        OPEN p_Cursor FOR
            SELECT * FROM Vendedor WHERE IdPersona = p_IdPersona;
        
        COMMIT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontró un vendedor con ID ' || p_ID);
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_Update_Vendedor;

  -- Implementación del procedimiento para eliminar un vendedor
    PROCEDURE sp_Delete_Vendedor (
        p_Cursor OUT SYS_REFCURSOR,
        p_ID IN INT
    ) AS
    BEGIN
    
        OPEN p_Cursor FOR
            SELECT * FROM VENDEDOR WHERE ID = p_ID;
        
        DELETE FROM Vendedor
        WHERE ID = p_ID;

        COMMIT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontró un vendedor con el ID ' || p_ID);
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_Delete_Vendedor;
END pq_Vendedor_Package;