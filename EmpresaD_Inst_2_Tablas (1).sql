USE EmpresaD_Inst_2;

CREATE TABLE Proveedores (
ID_Proveedor INT NOT NULL,
Nombre VARCHAR(100) NOT NULL,
PRIMARY KEY (ID_Proveedor)
);

CREATE TABLE Categorias (
ID_Categoria INT NOT NULL,
Descripcion VARCHAR(100) NOT NULL,
PRIMARY KEY (ID_Categoria)
);

CREATE TABLE Territorio (
ID_Territorio INT NOT NULL,
Descripcion VARCHAR(100) NOT NULL,
PRIMARY KEY (ID_Territorio)
);

CREATE TABLE GrupoClientes (
ID_GrupoC INT NOT NULL,
Descripcion VARCHAR(100) NOT NULL,
PRIMARY KEY (ID_GrupoC)
);

CREATE TABLE Empleados (
ID_Empleado INT NOT NULL,
ID_Territorio INT NOT NULL,
Nombre VARCHAR(100) NOT NULL,
PRIMARY KEY (ID_Empleado),
FOREIGN KEY (ID_Territorio) REFERENCES Territorio (ID_Territorio)
);

CREATE TABLE Productos (
ID_Producto INT NOT NULL,
ID_Proveedor INT NOT NULL,
ID_Categoria INT NOT NULL,
Nombre VARCHAR(100) NOT NULL,
Precio_Unitario BIGINT NOT NULL,
PRIMARY KEY (ID_Producto),
FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores (ID_Proveedor),
FOREIGN KEY (ID_Categoria) REFERENCES Categorias (ID_Categoria)
);

CREATE TABLE Clientes (
ID_Cliente INT NOT NULL,
ID_GrupoC INT NOT NULL,
Nombre VARCHAR(100) NOT NULL,
PRIMARY KEY (ID_Cliente),
FOREIGN KEY (ID_GrupoC) REFERENCES GrupoClientes (ID_GrupoC)
);

CREATE TABLE OrdenCompra (
ID_OrdenC INT NOT NULL,
ID_Empleado INT NOT NULL,
ID_Cliente INT NOT NULL,
PRIMARY KEY (ID_OrdenC),
FOREIGN KEY (ID_Empleado) REFERENCES Empleados (ID_Empleado),
FOREIGN KEY (ID_Cliente) REFERENCES Clientes (ID_Cliente)
);

CREATE TABLE DetalleOrdenCompra (
ID_OrdenC INT NOT NULL,
ID_Producto INT NOT NULL,
Cantidad INT NOT NULL,
FOREIGN KEY (ID_OrdenC) REFERENCES OrdenCompra (ID_OrdenC),
FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto)
);