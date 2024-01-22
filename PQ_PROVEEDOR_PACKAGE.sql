CREATE OR REPLACE PACKAGE pq_Proveedor_Package AS
  -- Procedimiento para insertar un nuevo Proveedor
  PROCEDURE sp_Insert_Proveedor (p_IdPersona IN INT);

  -- Procedimiento para listar todos los proveedores
  PROCEDURE sp_List_Proveedor_DDL;

  -- Procedimiento para actualizar un proveedor
  PROCEDURE sp_Update_Proveedor (p_IDProveedor IN INT, p_IdPersona IN INT);

  -- Procedimiento para eliminar un proveedor
  PROCEDURE sp_Delete_Proveedor (p_IDProveedor IN INT);
END pq_Proveedor_Package;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY pq_Proveedor_Package AS
  -- Implementación del procedimiento para insertar un nuevo proveedor
    PROCEDURE sp_Insert_Proveedor (p_IdPersona IN INT) AS
    BEGIN
        INSERT INTO Proveedor (IdPersona)
        VALUES (p_IdPersona);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_Insert_Proveedor;

  -- Implementación del procedimiento para listar todos los proveedores
    PROCEDURE sp_List_Proveedor_DDL AS
    BEGIN
        FOR ProveedorRow IN (
            SELECT 
                PER.nit_cedula AS "Nit o Cédula", 
                PER.nombre_razonsocial AS "Nombre o Razon Social", 
                PER.apellido AS "Apellido", 
                PER.telefono AS "Telefono", 
                PER.email AS "Correo electronico" 
            FROM Proveedor PRO 
            INNER JOIN Persona PER ON PRO.idpersona = PER.id
        ) LOOP
            DBMS_OUTPUT.PUT_LINE('Nit o Cédula: ' || ProveedorRow."Nit o Cédula");
            DBMS_OUTPUT.PUT_LINE('Nombre o Razon Social: ' || ProveedorRow."Nombre o Razon Social");
            DBMS_OUTPUT.PUT_LINE('Apellido: ' || ProveedorRow."Apellido");
            DBMS_OUTPUT.PUT_LINE('Telefono: ' || ProveedorRow."Telefono");
            DBMS_OUTPUT.PUT_LINE('Correo electronico: ' || ProveedorRow."Correo electronico");
            DBMS_OUTPUT.PUT_LINE('-----------------------');
        END LOOP;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontraron proveedores.');
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_List_Proveedor_DDL;

  -- Implementación del procedimiento para actualizar un proveedor
    PROCEDURE sp_Update_Proveedor (
        p_IDProveedor IN INT,
        p_IdPersona IN INT
    ) AS
    BEGIN
        UPDATE Proveedor
        SET IdPersona = p_IdPersona
        WHERE ID = p_IDProveedor;
    
        COMMIT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontró un proveedor con el ID ' || p_IDProveedor);
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_Update_Proveedor;

  -- Implementación del procedimiento para eliminar un proveedor
    PROCEDURE sp_Delete_Proveedor (p_IDProveedor IN INT) AS
    BEGIN
        DELETE FROM Proveedor
        WHERE ID = p_IDProveedor;
    
        COMMIT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontró un proveedor con el ID ' || p_IDProveedor);
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_Delete_Proveedor;
END pq_Proveedor_Package;