CREATE SCHEMA empresa;
USE empresa;

CREATE TABLE Clientes(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(50),
    cp INT,
    direccion VARCHAR(30),
    telefono INT,
    localidad VARCHAR(30)
);

CREATE TABLE Proveedores(
	   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     nombre VARCHAR(50) NOT NULL,
     cuit INT,
     descricion VARCHAR(50),
     direccion VARCHAR(60) NOT NULL,
     telefono INT,
     localidad VARCHAR(50)
);

CREATE TABLE Stock(
	   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       nombre VARCHAR(30),
       cantidad INT,
       costo DECIMAL(12,1) NOT NULL
);
	

CREATE TABLE Ventas(
	   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	 factura INT NOT NULL,
     fecha DATE NOT NULL,
     monto DECIMAL (12,1) NOT NULL,
     id_Clientes INT NOT NULL,
     FOREIGN KEY (id_Clientes) REFERENCES Clientes (id)
);

CREATE TABLE Compras(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	  factura INT NOT NULL ,
      fecha_oc DATE NOT NULL,
      monto DECIMAL(12.1),
      id_proveedor INT NOT NULL,
      FOREIGN KEY (id_proveedor) REFERENCES proveedores (id),
      FOREIGN KEY (factura) REFERENCES ventas (id)
);

CREATE TABLE Pagos(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        factura INT NOT NULL,
        id_cliente INT NOT NULL,
        id_producto INT NOT NULL,
        fecha DATE NOT NULL,
        precio DECIMAL(10,1) NOT NULL,
        cantidad INT,
        FOREIGN KEY (factura) REFERENCES ventas (id),
        FOREIGN KEY (id_cliente) REFERENCES clientes (id),
        FOREIGN KEY (id_producto) REFERENCES stock (id)
);