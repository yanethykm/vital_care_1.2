create or replace PROCEDURE sp_List_Vendedor_DDL AS
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