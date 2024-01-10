--------------------------------------------------------
----------- PROCEDIMIENTO ALMACENADO INSERT ------------
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Insert_Categoria (
    p_Categoria IN VARCHAR
) AS
BEGIN
    INSERT INTO Categoria (Categoria)
    VALUES (p_Categoria);
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Insert_Categoria;

--------------------------------------------------------
----------- PROCEDIMIENTO ALMACENADO DELETE ------------
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Delete_Categoria (
    p_IDCategoria IN INT
) AS
BEGIN
    DELETE FROM Categoria
    WHERE ID = p_IDCategoria;
    
    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró una categoría con el ID ' || p_IDCategoria);
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Delete_Categoria;

-------------------------------------------------------------------------------
--------------- PROCEDIMIENTO ALMACENADO UPDATE -------------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Update_Categoria (
    p_IDCategoria IN INT,
    p_Categoria IN VARCHAR
) AS
BEGIN
    UPDATE Categoria
    SET Categoria = p_Categoria
    WHERE ID = p_IDCategoria;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró una categoría con el ID ' || p_IDCategoria);
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END sp_Update_Categoria;

-------------------------------------------------------------------------------
--------------- PROCEDIMIENTO ALMACENADO LIST ---------------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_List_Categoria AS
BEGIN
    FOR CategoriaRow IN (SELECT Categoria FROM Categoria) LOOP
        DBMS_OUTPUT.PUT_LINE('Categoria: ' || CategoriaRow.Categoria);
        DBMS_OUTPUT.PUT_LINE('-----------------------');
    END LOOP;
END sp_List_Categoria;