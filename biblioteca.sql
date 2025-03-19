-- Tabla Usuario
CREATE TABLE Usuario (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Tabla Libro
CREATE TABLE Libro (
    id_libro SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    anio_publicacion INT
);

-- Tabla Prestamo
CREATE TABLE Prestamo (
    id_prestamo SERIAL PRIMARY KEY,
    id_usuario INT,
    id_libro INT,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro)
);

-- Inserción de datos de ejemplo para Biblioteca Digital
INSERT INTO Usuario (nombre, email) VALUES ('Carlos Ramírez', 'carlos@gmail.com');
INSERT INTO Libro (titulo, autor, anio_publicacion) VALUES ('Cien años de soledad', 'Gabriel García Márquez', 1967);
INSERT INTO Prestamo (id_usuario, id_libro, fecha_prestamo, fecha_devolucion) VALUES (1, 1, '2024-03-10', '2024-03-20');

-- Consulta de libros prestados a un usuario específico
SELECT Usuario.nombre, Libro.titulo, Prestamo.fecha_prestamo, Prestamo.fecha_devolucion 
FROM Prestamo 
JOIN Usuario ON Prestamo.id_usuario = Usuario.id_usuario 
JOIN Libro ON Prestamo.id_libro = Libro.id_libro 
WHERE Usuario.id_usuario = 1;
