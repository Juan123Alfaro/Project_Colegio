CREATE DATABASE bd_Colegio
GO

USE [bd_Colegio]
GO

CREATE TABLE Constante 
(
IdConstante INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
NombreConstante VARCHAR(45) NOT NULL,
Categoria VARCHAR(45) NOT NULL
)

CREATE TABLE Usuario 
(
IdUsuario INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Usuario VARCHAR(45) NOT NULL,
Contrasenia VARCHAR(45) NOT NULL,
IdTipoPersona INT NOT NULL,
IdPersona INT NOT NULL,
CONSTRAINT FK_UsuarioPersona FOREIGN KEY (IdPersona) REFERENCES Persona(IdPersona),
CONSTRAINT FK_UsuarioConstante FOREIGN KEY (IdTipoPersona) REFERENCES Constante(IdConstante)
)

CREATE TABLE Persona
(
IdPersona INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Nombre VARCHAR(45) NOT NULL,
ApellidoPaterno VARCHAR(45) NOT NULL,
ApellidoMaterno VARCHAR(45) NOT NULL,
IdTipoDocumento INT NOT NULL,
NumDocumento VARCHAR(45) NOT NULL,
IdTipoPersona INT NOT NULL,
IdPersonaCargo INT NOT NULL,
Direccion VARCHAR(45) NOT NULL,
Email VARCHAR(45) NOT NULL,
Telefono VARCHAR(45) NOT NULL,
FechaNacimiento DATE NOT NULL,
CONSTRAINT FK_PersonaConstante1 FOREIGN KEY (IdTipoDocumento) REFERENCES Constante(IdConstante),
CONSTRAINT FK_PersonaConstante2 FOREIGN KEY (IdTipoPersona) REFERENCES Constante(IdConstante),
CONSTRAINT FK_PersonaPersona FOREIGN KEY (IdPersonaCargo) REFERENCES Persona(IdPersona)
)

CREATE TABLE Informacion
(
IdInformacion INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Nombre VARCHAR(45) NOT NULL,
Estado CHAR(2) NOT NULL,
IdAlumno INT NOT NULL,
CONSTRAINT FK_InformacionPersona FOREIGN KEY (IdAlumno) REFERENCES Persona (IdPersona)
)

CREATE TABLE Especialidad 
(
IdEspecialidad INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Especialidad VARCHAR(45) NOT NULL
)

CREATE TABLE Docente_Especialidad 
(
IdDocenteEspecialidad INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
IdEspecialidad INT NOT NULL,
IdDocente INT NOT NULL,
CONSTRAINT FK_DocenteEspecialidadPersona  FOREIGN KEY (IdDocente) REFERENCES Persona(IdPersona),
CONSTRAINT FK_DocenteEspecialidadEspecialidad FOREIGN KEY (IdEspecialidad) REFERENCES Especialidad (IdEspecialidad)
)

CREATE TABLE Pago
(
IdPago INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Monto FLOAT NOT NULL,
IdApoderado INT NOT NULL,
IdReservaMatricula INT NOT NULL,
Fecha Date,
CONSTRAINT FK_PagoPersona FOREIGN KEY (IdApoderado) REFERENCES Persona(IdPersona),
CONSTRAINT FK_PagoReservaMatricula FOREIGN KEY (IdReservaMatricula) REFERENCES ReservaMatricula (IdReservaMatricula)
)

CREATE TABLE ReservaMatricula
(
IdReservaMatricula INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Estado VARCHAR(45) NOT NULL,
Costo FLOAT NOT NULL,
IdMatricula INT NOT NULL,
CONSTRAINT FK_ReservaMatriculaMatricula FOREIGN KEY (IdMatricula) REFERENCES Matricula (IdMatricula)
)

CREATE TABLE Matricula
(
IdMatricula INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Fecha DATE NOT NULL,
Estado CHAR(2) NOT NULL,
IdDocumento INT NOT NULL,
CONSTRAINT FK_MatriculaDocumento FOREIGN KEY (IdDocumento) REFERENCES Documento (IdDocumento)
)

CREATE TABLE DetalleMatricula
(
IdDetalleMatricula INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
IdMatricula INT NOT NULL,
IdDocumento INT NOT NULL,
CONSTRAINT FK_DetalleMatriculaMatricula FOREIGN KEY (IdMatricula) REFERENCES Matricula (IdMatricula),
CONSTRAINT FK_DetalleMatriculaDocumento FOREIGN KEY (IdDocumento) REFERENCES Documento (IdDocumento)
)

CREATE TABLE Documento
(
IdDocumento INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
IdAlumno INT NOT NULL,
IdGrado INT NOT NULL,
IdSeccion INT NOT NULL,
IdAnioEscolar INT NOT NULL,
CONSTRAINT FK_DocumentoPersona FOREIGN KEY (IdAlumno) REFERENCES Persona (IdPersona),
CONSTRAINT FK_DocumentoSeccion FOREIGN KEY (IdSeccion) REFERENCES Seccion (IdSeccion),
CONSTRAINT FK_DocumentoGrado FOREIGN KEY (IdGrado) REFERENCES Grado (IdGrado),
CONSTRAINT FK_DocumentoAnioEscolar FOREIGN KEY (IdAnioEscolar) REFERENCES AnioEscolar (IdAnioEscolar)
)

CREATE TABLE Seccion
(
IdSeccion INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Seccion CHAR(2) NOT NULL
)

CREATE TABLE AnioEscolar
(
IdAnioEscolar INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Anio INT NOT NULL
)

CREATE TABLE Grado
(
IdGrado INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Grado INT NOT NULL,
IdTurno INT,
CONSTRAINT FK_GradoTurno FOREIGN KEY (IdTurno) REFERENCES Turno(IdTurno)
)

CREATE TABLE Turno
(
IdTurno INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Turno VARCHAR(45) NOT NULL
)

CREATE TABLE Asignatura
(
IdAsignatura INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
NombreAsignatura VARCHAR(45) NOT NULL
)

CREATE TABLE DetalleDocumento
(
IdDetalleDocumento INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
IdAsignatura INT NOT NULL,
IdDocumento INT NOT NULL,
IdDocente INT NOT NULL,
CONSTRAINT FK_DetalleDocumentoAsignatura FOREIGN KEY (IdAsignatura) REFERENCES Asignatura(IdAsignatura),
CONSTRAINT FK_DetalleDocumentoDocumento FOREIGN KEY (IdDocumento) REFERENCES Documento(IdDocumento),
CONSTRAINT FK_DetalleDocumentoPersona FOREIGN KEY (IdDocente) REFERENCES Persona(IdPersona)
)