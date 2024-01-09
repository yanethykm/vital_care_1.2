--------------------------------------------------------
----------- PROCEDIMIENTO ALMACENADO INSERT ------------
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Insert_Vendedor (
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


------------------------------------------------------------------------------
--------- PROCEDIMIENTO ALMACENADO DELETE ------------------------------------
------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Delete_Vendedor (
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

-------------------------------------------------------------------------------
--------------- PROCEDIMIENTO ALMACENADO UPDATE -------------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Update_Vendedor (
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

-------------------------------------------------------------------------------
--------------- PROCEDIMIENTO ALMACENADO LIST ---------------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_List_Vendedor AS
BEGIN
FOR VendedorRow IN (SELECT IdPersona FROM Vendedor) LOOP
    DBMS_OUTPUT.PUT_LINE( 
            ' | Id Vendedor: ' || VendedorRow.IdPersona
        );
    END LOOP;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron usuarios.');
    WHEN OTHERS THEN
        RAISE;
END sp_List_Vendedor;