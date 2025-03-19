-- Tabla Empleado
CREATE TABLE Empleado (
    id_empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    puesto VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);

-- Tabla Departamento
CREATE TABLE Departamento (
    id_departamento SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla Asignacion
CREATE TABLE Asignacion (
    id_empleado INT,
    id_departamento INT,
    fecha_asignacion DATE NOT NULL,
    PRIMARY KEY (id_empleado, id_departamento),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
);

-- Inserción de datos de ejemplo para Recursos Humanos
INSERT INTO Empleado (nombre, puesto, salario) VALUES ('María González', 'Gerente', 5000.00);
INSERT INTO Departamento (nombre) VALUES ('Ventas');
INSERT INTO Asignacion (id_empleado, id_departamento, fecha_asignacion) VALUES (1, 1, '2024-03-01');

-- Consulta de empleados en un departamento específico
SELECT Empleado.nombre, Empleado.puesto, Departamento.nombre AS departamento 
FROM Asignacion 
JOIN Empleado ON Asignacion.id_empleado = Empleado.id_empleado 
JOIN Departamento ON Asignacion.id_departamento = Departamento.id_departamento 
WHERE Departamento.id_departamento = 1;