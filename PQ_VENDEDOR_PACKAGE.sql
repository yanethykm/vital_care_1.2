CREATE OR REPLACE PACKAGE pq_Vendedor_Package AS
  -- Procedimiento para insertar un nuevo vendedor
  PROCEDURE sp_Insert_Vendedor (p_IdPersona IN INT);

  -- Procedimiento para listar todos los vendedores
  PROCEDURE sp_List_Vendedor_DDL;

  -- Procedimiento para actualizar un vendedor
  PROCEDURE sp_Update_Vendedor (
    p_ID IN INT,
    p_IdPersona IN INT);

  -- Procedimiento para eliminar un vendedor
  PROCEDURE sp_Delete_Vendedor (p_ID IN INT);
END pq_Vendedor_Package;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY pq_Vendedor_Package AS
  -- Implementación del procedimiento para insertar un nuevo vendedor
    PROCEDURE sp_Insert_Vendedor (
        p_IdPersona IN INT
    ) AS
    BEGIN
        INSERT INTO Vendedor (IdPersona)
        VALUES (p_IdPersona);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_Insert_Vendedor;

  -- Implementación del procedimiento para listar todos los vendedores
    PROCEDURE sp_List_Vendedor_DDL AS
    BEGIN
        FOR VendedorRow IN (
            SELECT 
            P.nit_cedula as "Identificacion", 
            P.nombre_razonsocial as "Nombre/Razon Social", 
            P.apellido as "Apellido", 
            P.telefono as "Telefono", 
            P.email as "Correo electronico"
        FROM Vendedor V
        INNER JOIN Persona P on V.idpersona = P.ID
        ) LOOP
            DBMS_OUTPUT.PUT_LINE('Identificacion: ' || VendedorRow."Identificacion");
            DBMS_OUTPUT.PUT_LINE('Nombre/Razon Social: ' || VendedorRow."Nombre/Razon Social");
            DBMS_OUTPUT.PUT_LINE('Apellido: ' || VendedorRow."Apellido");
            DBMS_OUTPUT.PUT_LINE('Telefono: ' || VendedorRow."Telefono");
            DBMS_OUTPUT.PUT_LINE('Correo electronico: ' || VendedorRow."Correo electronico");
            DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------');
        END LOOP;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontraron Vendedores.');
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_List_Vendedor_DDL;

  -- Implementación del procedimiento para actualizar un vendedor
    PROCEDURE sp_Update_Vendedor (
        p_ID IN INT,
        p_IdPersona IN INT
    ) AS
    BEGIN
        UPDATE Vendedor
        SET IdPersona = p_IdPersona
        WHERE id = p_ID;
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
        p_ID IN INT
    ) AS
    BEGIN
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