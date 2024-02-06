CREATE OR REPLACE PACKAGE pq_Categoria_Package AS
  -- Procedimiento para insertar una nueva categoría
  PROCEDURE sp_Insert_Categoria(p_Cursor OUT SYS_REFCURSOR, p_Categoria IN VARCHAR2);

  -- Procedimiento para listar todas las categorías
  PROCEDURE sp_List_Categoria (p_Cursor OUT SYS_REFCURSOR);

  -- Procedimiento para actualizar una categoría por ID
  PROCEDURE sp_Update_Categoria(p_Cursor OUT SYS_REFCURSOR, p_IDCategoria IN INT, p_Categoria IN VARCHAR2);

  -- Procedimiento para eliminar una categoría por ID
  PROCEDURE sp_Delete_Categoria(p_Cursor OUT SYS_REFCURSOR, p_IDCategoria IN INT);
END pq_Categoria_Package;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY pq_Categoria_Package AS
  -- Implementación del procedimiento para insertar una nueva categoría
    PROCEDURE sp_Insert_Categoria(p_Cursor OUT SYS_REFCURSOR, p_Categoria IN VARCHAR2) IS
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

  -- Implementación del procedimiento para listar todas las categorías
  PROCEDURE sp_List_Categoria (p_Cursor OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN p_Cursor FOR SELECT Categoria FROM Categoria; 
  END sp_List_Categoria;

  -- Implementación del procedimiento para actualizar una categoría por ID
  PROCEDURE sp_Update_Categoria(p_Cursor OUT SYS_REFCURSOR, p_IDCategoria IN INT, p_Categoria IN VARCHAR2) IS
    BEGIN
        -- Actualizar la categoría
        UPDATE Categoria
        SET Categoria = p_Categoria
        WHERE ID = p_IDCategoria;
    
        -- Abrir el cursor de salida con los datos de la categoría actualizada
        OPEN p_Cursor FOR
            SELECT * FROM Categoria WHERE ID = p_IDCategoria;
    
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_Update_Categoria;

  -- Implementación del procedimiento para eliminar una categoría por ID
  PROCEDURE sp_Delete_Categoria(p_Cursor OUT SYS_REFCURSOR, p_IDCategoria IN INT) IS
    BEGIN
        -- Guardar datos de la categoría antes de eliminarla
        OPEN p_Cursor FOR
            SELECT * FROM Categoria WHERE ID = p_IDCategoria;
    
        -- Eliminar la categoría
        DELETE FROM Categoria
        WHERE ID = p_IDCategoria;
    
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END sp_Delete_Categoria;
END pq_Categoria_Package;

