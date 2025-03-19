-- Tabla Cliente
CREATE TABLE Cliente (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Tabla Producto
CREATE TABLE Producto (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);

-- Tabla Pedido
CREATE TABLE Pedido (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INT,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Tabla DetallePedido
CREATE TABLE DetallePedido (
    id_pedido INT,
    id_producto INT,
    cantidad INT NOT NULL,
    PRIMARY KEY (id_pedido, id_producto),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

-- Inserción de datos de ejemplo para Tienda en Línea
INSERT INTO Cliente (nombre, email) VALUES ('Ana Gómez', 'ana@gmail.com');
INSERT INTO Producto (nombre, precio) VALUES ('Laptop', 800.00);
INSERT INTO Pedido (id_cliente, fecha) VALUES (1, '2024-03-15');
INSERT INTO DetallePedido (id_pedido, id_producto, cantidad) VALUES (1, 1, 2);

INSERT INTO Cliente (nombre, email) VALUES ('Sergio Ramoz', 'guason@gmail.com');
INSERT INTO Producto (nombre, precio) VALUES ('libreta', 40.00);
INSERT INTO Pedido (id_cliente, fecha) VALUES (2, '2026-03-05');
INSERT INTO DetallePedido (id_pedido, id_producto, cantidad) VALUES (5, 6, 2);

INSERT INTO Cliente (nombre, email) VALUES ('Luis Ruiz', 'games@gmail.com');
INSERT INTO Producto (nombre, precio) VALUES ('usb', 140.00);
INSERT INTO Pedido (id_cliente, fecha) VALUES (3, '2025-01-07');
INSERT INTO DetallePedido (id_pedido, id_producto, cantidad) VALUES (14, 21, 1);

INSERT INTO Cliente (nombre, email) VALUES ('Monica Medina', 'hellokitty@gmail.com');
INSERT INTO Producto (nombre, precio) VALUES ('peluche', 900.00);
INSERT INTO Pedido (id_cliente, fecha) VALUES (4, '2024-09-04');
INSERT INTO DetallePedido (id_pedido, id_producto, cantidad) VALUES (11, 34, 4);

INSERT INTO Cliente (nombre, email) VALUES ('Alicia Juarez', 'rabitt@gmail.com');
INSERT INTO Producto (nombre, precio) VALUES ('Rasuradora', 260.80);
INSERT INTO Pedido (id_cliente, fecha) VALUES (5, '2025-09-11');
INSERT INTO DetallePedido (id_pedido, id_producto, cantidad) VALUES (9, 17, 1);


-- Consulta de productos comprados por un cliente específico
SELECT Cliente.nombre, Producto.nombre AS producto, DetallePedido.cantidad 
FROM Pedido 
JOIN Cliente ON Pedido.id_cliente = Cliente.id_cliente 
JOIN DetallePedido ON Pedido.id_pedido = DetallePedido.id_pedido 
JOIN Producto ON DetallePedido.id_producto = Producto.id_producto 
WHERE Cliente.id_cliente = 1;
