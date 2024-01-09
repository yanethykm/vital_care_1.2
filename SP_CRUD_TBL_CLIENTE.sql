--------------------------------------------------------
----------- PROCEDIMIENTO ALMACENADO INSERT ------------
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Insert_Cliente (
    p_IdPersona IN INT
) AS
BEGIN
    INSERT INTO Cliente (IdPersona)
    VALUES (p_IdPersona);

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Insert_Cliente;

--------------------------------------------------------
----------- PROCEDIMIENTO ALMACENADO DELETE ------------
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Delete_Cliente (
    p_IDCliente IN INT
) AS
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

-------------------------------------------------------------------------------
--------------- PROCEDIMIENTO ALMACENADO UPDATE -------------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Update_Cliente (
    p_IDCliente IN INT,
    p_IdPersona IN INT
) AS
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

-------------------------------------------------------------------------------
--------------- PROCEDIMIENTO ALMACENADO LIST ---------------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_List_Cliente AS
BEGIN
    FOR ClienteRow IN (SELECT IdPersona FROM Cliente) LOOP
        DBMS_OUTPUT.PUT_LINE('ID de la Persona relacionada: ' || ClienteRow.IdPersona);
    END LOOP;
END sp_List_Cliente;