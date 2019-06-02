CREATE TABLE cliente(
	idCliente INT PRIMARY KEY IDENTITY,
	nombreCliente VARCHAR(100),
	direccion VARCHAR(100),
	telefono CHAR(10),
	correo VARCHAR(50)
);

CREATE TABLE medico(
	idMedico INT PRIMARY KEY,
	nombreMedico VARCHAR(100),
	salario MONEY,
	FechaContrato DATE
);

CREATE TABLE raza(
	idRaza INT PRIMARY KEY IDENTITY,
	raza VARCHAR(50)
);

CREATE TABLE paciente(
	idPaciente INT PRIMARY KEY IDENTITY,
	nombrePaciente VARCHAR(50),
	idCliente INT,
	idRaza INT,
	fechaNacimiento DATE
);

CREATE TABLE consulta(
	idConsulta INT PRIMARY KEY IDENTITY,
	idPaciente INT,
	idMedico INT,
	fecha DATE,
	precioConsulta MONEY
);

CREATE TABLE medicamento(
	idMedicamento INT PRIMARY KEY IDENTITY,
	nombre VARCHAR(50),
	precio MONEY
);

CREATE TABLE receta(
	idMedicamento INT NOT NULL,
	idConsulta INT NOT NULL
);