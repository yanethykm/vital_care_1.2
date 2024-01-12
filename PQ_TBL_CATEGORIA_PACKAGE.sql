CREATE OR REPLACE PACKAGE pq_Categoria_Package AS
  -- Procedimiento para insertar una nueva categoría
  PROCEDURE sp_Insert_Categoria(p_Categoria IN VARCHAR2);

  -- Procedimiento para listar todas las categorías
  PROCEDURE sp_List_Categoria;

  -- Procedimiento para actualizar una categoría por ID
  PROCEDURE sp_Update_Categoria(p_IDCategoria IN INT, p_Categoria IN VARCHAR2);

  -- Procedimiento para eliminar una categoría por ID
  PROCEDURE sp_Delete_Categoria(p_IDCategoria IN INT);
END pq_Categoria_Package;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY pq_Categoria_Package AS
  -- Implementación del procedimiento para insertar una nueva categoría
  PROCEDURE sp_Insert_Categoria(p_Categoria IN VARCHAR2) IS
  BEGIN
    INSERT INTO Categoria (Categoria)
    VALUES (p_Categoria);
    COMMIT;
  END sp_Insert_Categoria;

  -- Implementación del procedimiento para listar todas las categorías
  PROCEDURE sp_List_Categoria IS
  BEGIN
    FOR CategoriaRow IN (SELECT Categoria FROM Categoria) 
    LOOP
        DBMS_OUTPUT.PUT_LINE('Categoria: ' || CategoriaRow.Categoria);
        DBMS_OUTPUT.PUT_LINE('-----------------------');
    END LOOP;
  END sp_List_Categoria;

  -- Implementación del procedimiento para actualizar una categoría por ID
  PROCEDURE sp_Update_Categoria(p_IDCategoria IN INT, p_Categoria IN VARCHAR2) IS
  BEGIN
    UPDATE Categoria
    SET Categoria = p_Categoria
    WHERE ID = p_IDCategoria;
    COMMIT;
  END sp_Update_Categoria;

  -- Implementación del procedimiento para eliminar una categoría por ID
  PROCEDURE sp_Delete_Categoria(p_IDCategoria IN INT) IS
  BEGIN
    DELETE FROM Categoria
    WHERE ID = p_IDCategoria;
    COMMIT;
  END sp_Delete_Categoria;
END pq_Categoria_Package;

