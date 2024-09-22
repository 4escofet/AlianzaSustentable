CREATE DATABASE AlianzaSustentable;
GO

USE AlianzaSustentable;
GO

-- Crear la tabla Entidad
CREATE TABLE Entidad (
    id_entidad INT PRIMARY KEY,
    CUIT INT,
    Nombre CHAR(50),
    Domicilio CHAR(50),
	Fecha DATETIME
);

-- Crear la tabla Evaluador
CREATE TABLE Evaluador (
    id_evaluador INT PRIMARY KEY,
    CUIT INT,
    Nombre CHAR(50),
    Domicilio CHAR(50),
	Fecha DATETIME
);

-- Crear la tabla Entidad_Evaluador
CREATE TABLE Entidad_Evaluador (
    id_entidad_evaluador INT PRIMARY KEY,
    id_entidad INT FOREIGN KEY REFERENCES Entidad(id_entidad),
    id_evaluador INT FOREIGN KEY REFERENCES Evaluador(id_evaluador),
    Fecha_asignacion DATETIME,
    Fecha_fin_asignacion DATETIME
);

-- Crear la tabla Proyecto
CREATE TABLE Proyecto (
    id_proyecto INT PRIMARY KEY,
    id_entidad_madre INT FOREIGN KEY REFERENCES Entidad(id_entidad),
    Nombre_proyecto CHAR(50),
	Fecha DATETIME,
    id_evaluador INT FOREIGN KEY REFERENCES Evaluador(id_evaluador)
);

-- Crear la tabla Proyecto_entidades
CREATE TABLE Proyecto_entidades (
    id_proyecto_entidades INT PRIMARY KEY,
    id_proyecto INT FOREIGN KEY REFERENCES Proyecto(id_proyecto),
    id_entidad INT FOREIGN KEY REFERENCES Entidad(id_entidad)
);

-- Crear la tabla Formularios
CREATE TABLE Formularios (
    id_formulario INT PRIMARY KEY,
    Nombre CHAR(50),
    version INT,
    valido BIT
);

-- Crear la tabla Preguntas
CREATE TABLE Preguntas (
    id_pregunta INT PRIMARY KEY,
    id_formulario INT FOREIGN KEY REFERENCES Formularios(id_formulario),
    Texto_pregunta NVARCHAR(MAX),
    tipo_respuesta NVARCHAR(10) CHECK (tipo_respuesta IN ('Numerico', 'Texto', 'Seleccion'))
);

-- Crear la tabla Proyecto_Formularios
CREATE TABLE Proyecto_Formularios (
    id_proyecto_formulario INT PRIMARY KEY,
    id_proyecto INT FOREIGN KEY REFERENCES Proyecto(id_proyecto),
    id_formulario INT FOREIGN KEY REFERENCES Formularios(id_formulario)
);

-- Crear la tabla Respuestas
CREATE TABLE Respuestas (
    id_respuesta INT PRIMARY KEY,
    id_pregunta INT FOREIGN KEY REFERENCES Preguntas(id_pregunta),
    id_entidad INT FOREIGN KEY REFERENCES Entidad(id_entidad),
	fecha DATETIME,
    id_diccionario INT,
	valor_respuesta FLOAT
);

-- Crear diccionario
CREATE TABLE Diccionario (
	id_diccionario INT PRIMARY KEY,
	id_pregunta INT FOREIGN KEY REFERENCES Preguntas(id_pregunta),
	valor INT NOT NULL,
	descripcion CHAR(50)
);
