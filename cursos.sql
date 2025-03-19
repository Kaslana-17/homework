-- Tabla Estudiante
CREATE TABLE Estudiante (
    id_estudiante SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Tabla Curso
CREATE TABLE Curso (
    id_curso SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    instructor VARCHAR(100) NOT NULL
);

-- Tabla Inscripcion
CREATE TABLE Inscripcion (
    id_estudiante INT,
    id_curso INT,
    fecha_inscripcion DATE NOT NULL,
    PRIMARY KEY (id_estudiante, id_curso),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- Inserción de datos de ejemplo para Plataforma de Cursos
INSERT INTO Estudiante (nombre, email) VALUES ('Laura Pérez', 'laura@gmail.com');
INSERT INTO Curso (titulo, instructor) VALUES ('SQL Avanzado', 'Dr. Rodríguez');
INSERT INTO Inscripcion (id_estudiante, id_curso, fecha_inscripcion) VALUES (1, 1, '2024-03-05');

-- Consulta de cursos inscritos por un estudiante específico
SELECT Estudiante.nombre, Curso.titulo, Curso.instructor, Inscripcion.fecha_inscripcion 
FROM Inscripcion 
JOIN Estudiante ON Inscripcion.id_estudiante = Estudiante.id_estudiante 
JOIN Curso ON Inscripcion.id_curso = Curso.id_curso 
WHERE Estudiante.id_estudiante = 1;
