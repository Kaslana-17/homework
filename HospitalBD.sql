-- Tabla Paciente
CREATE TABLE Paciente (
    id_paciente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad INT,
    direccion VARCHAR(255),
    telefono VARCHAR(15)
);

-- Tabla Médico
CREATE TABLE Medico (
    id_medico SERIAL PRIMARY KEY ,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    telefono VARCHAR(15)
);

-- Tabla Tratamiento
CREATE TABLE Tratamiento (
    id_tratamiento SERIAL PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL,
    costo DECIMAL(10,2)
);

-- Tabla Cita
CREATE TABLE Cita (
    id_cita SERIAL PRIMARY KEY,
    id_paciente INT,
    id_medico INT,
    fecha DATE,
    hora TIME,
    id_tratamiento INT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico),
    FOREIGN KEY (id_tratamiento) REFERENCES Tratamiento(id_tratamiento)
);

-- Inserción de datos de ejemplo para Hospital
INSERT INTO Paciente (nombre, edad, direccion, telefono) VALUES ('Juan Pérez', 35, 'Calle 123', '555-1234');
INSERT INTO Medico (nombre, especialidad, telefono) VALUES ('Dr. López', 'Cardiología', '555-5678');
INSERT INTO Tratamiento (descripcion, costo) VALUES ('Consulta General', 50.00);
INSERT INTO Cita (id_paciente, id_medico, fecha, hora, id_tratamiento) VALUES (1, 1, '2024-03-20', '10:00:00', 1);

INSERT INTO Paciente (nombre, edad, direccion, telefono) VALUES ('María González', 28, 'Avenida Central 45', '555-9876');
INSERT INTO Paciente (nombre, edad, direccion, telefono) VALUES ('Carlos Ramírez', 42, 'Calle Los Olivos 12', '555-6543');
INSERT INTO Paciente (nombre, edad, direccion, telefono) VALUES ('Ana Torres', 31, 'Boulevard Reforma 90', '555-1111');
INSERT INTO Paciente (nombre, edad, direccion, telefono) VALUES ('Pedro Sánchez', 50, 'Callejón Flores 22', '555-2222');
INSERT INTO Paciente (nombre, edad, direccion, telefono) VALUES ('Laura Medina', 37, 'Carrera 15 #23-44', '555-3333');

INSERT INTO Medico (nombre, especialidad, telefono) VALUES ('Dr. Fernández', 'Pediatría', '555-7777');
INSERT INTO Medico (nombre, especialidad, telefono) VALUES ('Dra. Rodríguez', 'Dermatología', '555-8888');
INSERT INTO Medico (nombre, especialidad, telefono) VALUES ('Dr. Martínez', 'Neurología', '555-9999');
INSERT INTO Medico (nombre, especialidad, telefono) VALUES ('Dra. López', 'Ginecología', '555-1212');
INSERT INTO Medico (nombre, especialidad, telefono) VALUES ('Dr. González', 'Ortopedia', '555-1313');

INSERT INTO Tratamiento (descripcion, costo) VALUES ('Terapia Física', 75.00);
INSERT INTO Tratamiento (descripcion, costo) VALUES ('Consulta Dermatológica', 60.00);
INSERT INTO Tratamiento (descripcion, costo) VALUES ('Radiografía', 120.00);
INSERT INTO Tratamiento (descripcion, costo) VALUES ('Examen de Sangre', 40.00);
INSERT INTO Tratamiento (descripcion, costo) VALUES ('Chequeo Neurológico', 90.00);

INSERT INTO Cita (id_paciente, id_medico, fecha, hora, id_tratamiento) VALUES (2, 3, '2024-03-22', '14:30:00', 2);
INSERT INTO Cita (id_paciente, id_medico, fecha, hora, id_tratamiento) VALUES (3, 5, '2024-03-25', '09:15:00', 3);
INSERT INTO Cita (id_paciente, id_medico, fecha, hora, id_tratamiento) VALUES (4, 2, '2024-03-28', '11:00:00', 1);
INSERT INTO Cita (id_paciente, id_medico, fecha, hora, id_tratamiento) VALUES (5, 4, '2024-03-30', '16:45:00', 5);
INSERT INTO Cita (id_paciente, id_medico, fecha, hora, id_tratamiento) VALUES (1, 1, '2024-04-02', '08:00:00', 4);

-- Consulta de citas de un paciente específico
SELECT Cita.id_cita, Medico.nombre AS medico, Cita.fecha, Cita.hora, Tratamiento.descripcion 
FROM Cita 
JOIN Medico ON Cita.id_medico = Medico.id_medico 
JOIN Tratamiento ON Cita.id_tratamiento = Tratamiento.id_tratamiento 
WHERE Cita.id_paciente = 1;

