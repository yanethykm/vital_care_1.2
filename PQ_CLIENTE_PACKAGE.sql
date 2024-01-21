
CREATE OR REPLACE PACKAGE pq_Cliente_Package AS
  -- Procedimiento para insertar una nueva categoría
  PROCEDURE sp_Insert_Cliente (p_IdPersona IN INT);

  -- Procedimiento para listar todas las categorías
  PROCEDURE sp_List_Cliente_DDL;

  -- Procedimiento para actualizar una categoría por ID
  PROCEDURE sp_Update_Cliente (p_IDCliente IN INT, p_IdPersona IN INT);

  -- Procedimiento para eliminar una categoría por ID
  PROCEDURE sp_Delete_Cliente (p_IDCliente IN INT);
END pq_Cliente_Package;

----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY pq_Cliente_Package AS
  -- Procedimiento para insertar un nuevo cliente
  PROCEDURE sp_Insert_Cliente ( p_IdPersona IN INT ) AS
    BEGIN
        INSERT INTO Cliente (IdPersona)
        VALUES (p_IdPersona);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
END sp_Insert_Cliente;

  -- Procedimiento para listar todos los clientes
  PROCEDURE sp_List_Cliente_DDL AS
    BEGIN
        FOR ClienteRow IN (
            SELECT 
                P.nit_cedula as "Identificacion", 
                P.nombre_razonsocial as "Nombre/Razon Social", 
                P.apellido as "Apellido", 
                P.telefono as "Telefono", 
                P.email as "Correo electronico"
        FROM Cliente C
        INNER JOIN Persona P on C.idpersona = P.id
        ) LOOP
            DBMS_OUTPUT.PUT_LINE('Identificacion: ' || ClienteRow."Identificacion");
            DBMS_OUTPUT.PUT_LINE('Nombre/Razon Social: ' || ClienteRow."Nombre/Razon Social");
            DBMS_OUTPUT.PUT_LINE('Apellido: ' || ClienteRow."Apellido");
            DBMS_OUTPUT.PUT_LINE('Telefono: ' || ClienteRow."Telefono");
            DBMS_OUTPUT.PUT_LINE('Correo electronico: ' || ClienteRow."Correo electronico");
            DBMS_OUTPUT.PUT_LINE('-----------------------');
        END LOOP;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontraron Clientes.');
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
END sp_List_Cliente_DDL;

  -- Procedimiento para actualizar un cliente
  PROCEDURE sp_Update_Cliente (p_IDCliente IN INT, p_IdPersona IN INT) AS
    BEGIN
        UPDATE Cliente
        SET IdPersona = p_IdPersona
        WHERE ID = p_IDCliente;
    
        COMMIT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontró un cliente con el ID ' || p_IDCliente);
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
END sp_Update_Cliente;

  -- Procedimiento para eliminar un cliente
 PROCEDURE sp_Delete_Cliente (p_IDCliente IN INT) AS
    BEGIN
        DELETE FROM Cliente
        WHERE ID = p_IDCliente;
    COMMIT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontró un cliente con el ID ' || p_IdCliente);
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_Delete_Cliente;
END pq_Cliente_Package;
