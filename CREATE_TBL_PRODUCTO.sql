---------------------------------/
--- TABLA PRODUCTO --------------/
---------------------------------/
CREATE TABLE Producto (
    ID INT PRIMARY KEY,
    Producto VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL,
    PrecioVenta INT,
    CantidadMinima INT,
    Cantidad INT,
    IdCategoria INT,
    FOREIGN KEY (IdCategoria) REFERENCES Categoria(ID),
    IdProveedor INT,
    FOREIGN KEY (IdProveedor) REFERENCES Proveedor(ID)
);