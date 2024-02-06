--------------------------------------------------------
----------- PROCEDIMIENTO ALMACENADO INSERT ------------
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Insert_Categoria(p_Cursor OUT SYS_REFCURSOR, p_Categoria IN VARCHAR2) IS
    BEGIN
        INSERT INTO Categoria (Categoria)
        VALUES (p_Categoria);
        
        OPEN p_Cursor FOR
            SELECT * FROM Categoria WHERE Categoria = p_Categoria;
    
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
END sp_Insert_Categoria;

--------------------------------------------------------
----------- PROCEDIMIENTO ALMACENADO DELETE ------------
--------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Delete_Categoria(p_Cursor OUT SYS_REFCURSOR, p_IDCategoria IN INT) IS
    BEGIN
        -- Guardar datos de la categor�a antes de eliminarla
        OPEN p_Cursor FOR
            SELECT * FROM Categoria WHERE ID = p_IDCategoria;
    
        -- Eliminar la categor�a
        DELETE FROM Categoria
        WHERE ID = p_IDCategoria;
    
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
END sp_Delete_Categoria;

-------------------------------------------------------------------------------
--------------- PROCEDIMIENTO ALMACENADO UPDATE -------------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_Update_Categoria(p_Cursor OUT SYS_REFCURSOR, p_IDCategoria IN INT, p_Categoria IN VARCHAR2) IS
    BEGIN
        -- Actualizar la categor�a
        UPDATE Categoria
        SET Categoria = p_Categoria
        WHERE ID = p_IDCategoria;
    
        -- Abrir el cursor de salida con los datos de la categor�a actualizada
        OPEN p_Cursor FOR
            SELECT * FROM Categoria WHERE ID = p_IDCategoria;
    
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
END sp_Update_Categoria;

-------------------------------------------------------------------------------
--------------- PROCEDIMIENTO ALMACENADO LIST ---------------------------------
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE sp_List_Categoria (p_Cursor OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN p_Cursor FOR SELECT Categoria FROM Categoria; 
  END sp_List_Categoria;