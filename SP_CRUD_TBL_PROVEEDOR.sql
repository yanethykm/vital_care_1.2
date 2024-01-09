--------------------------------------------------------
----------- PROCEDIMIENTO ALMACENADO INSERT ------------
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Insert_Proveedor (
    p_IdPersona IN INT
) AS
BEGIN
    INSERT INTO Proveedor (IdPersona)
    VALUES (p_IdPersona);

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Insert_Proveedor;

--------------------------------------------------------
----------- PROCEDIMIENTO ALMACENADO DELETE ------------
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Delete_Proveedor (
    p_IDProveedor IN INT
) AS
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

-------------------------------------------------------------------------------
--------------- PROCEDIMIENTO ALMACENADO UPDATE -------------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Update_Proveedor (
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

-------------------------------------------------------------------------------
--------------- PROCEDIMIENTO ALMACENADO LIST ---------------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_List_Proveedor AS
BEGIN
    FOR ProveedorRow IN (SELECT IdPersona FROM Proveedor) LOOP
        DBMS_OUTPUT.PUT_LINE('ID de la Persona relacionada: ' || ProveedorRow.IdPersona);
    END LOOP;
END sp_List_Proveedor;