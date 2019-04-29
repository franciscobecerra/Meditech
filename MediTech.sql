CREATE DATABASE MEDITECH;
USE MEDITECH;


CREATE TABLE PAISES
(
  Id_Pais int  not null,
  Nombre VARCHAR(30),

  PRIMARY KEY(Id_Pais)
);
-- (Prueba)
--insert into PAISES values(1,"México");

CREATE TABLE ESTADOS
(
  Id_Estado int not null,
  Id_Pais int ,
  Nombre VARCHAR(30) ,

  PRIMARY KEY(Id_Estado),
  FOREIGN KEY (Id_Pais) REFERENCES PAISES (Id_Pais)
);
-- (Prueba)
--insert into ESTADOS values(1,1,"Jalisco");

CREATE TABLE CIUDADES
(
  Id_Ciudad int NOT NULL,
  Id_Estado int,
  Nombre VARCHAR(30) ,

  PRIMARY KEY(Id_Ciudad),
  FOREIGN KEY (Id_Estado) REFERENCES ESTADOS (Id_Estado)
);
-- (Prueba)
--insert into CIUDADES values(1,1,"TK");

CREATE TABLE PACIENTES
(
  UsuarioPaciente VARCHAR(30) not null,
  Id_Ciudad int,
  Pass VARCHAR (30) not null,
  Genero VARCHAR(10),
  Nombre VARCHAR(30),
  ApellidoPaterno VARCHAR(30),
  ApellidoMaterno VARCHAR(30),
  Telefono VARCHAR(10),
  Correo VARCHAR(30),
  FechaNacimiento DATE,
  Calle VARCHAR(30),
  CodigoPostal int,
  NumeroSeguridadSocial bigint,
  Activo int,

  PRIMARY KEY(UsuarioPaciente),
  FOREIGN KEY (Id_Ciudad) REFERENCES CIUDADES (Id_Ciudad)
);
-- (Prueba)
--insert into pacientes values("Dape",password("34f"),"TK","F","Raul","Perez","Torres","1234567890","asd@gnal.com","01/02/1997","TorresNilo # 34",49900,213213123,1);

CREATE TABLE DOCTORES
(
  UsuarioDoctor VARCHAR(30) not null,
  Id_Ciudad int,
  Pass VARCHAR(30) not null,
  Nombre VARCHAR(30),
  ApellidoPaterno VARCHAR(30),
  ApellidoMaterno VARCHAR(30),
  CedulaProfesional VARCHAR(30),
  Telefono VARCHAR(10),
  Correo VARCHAR(30),
  Calle VARCHAR(30),
  CodigoPostal int,
  Activo int,

  PRIMARY KEY(UsuarioDoctor),
  FOREIGN KEY (Id_Ciudad) REFERENCES CIUDADES (Id_Ciudad)
);

CREATE TABLE RECETAS
(
  Id_Receta int NOT NULL AUTO_INCREMENT,
  UsuarioPaciente VARCHAR(20) not null,
  UsuarioDoctor VARCHAR(20) not null,
  Diagnostico VARCHAR(50),
  Recomendacion VARCHAR(100),
  Fecha DATE,
  Activa int ,

  PRIMARY KEY(Id_Receta),
  FOREIGN KEY (UsuarioPaciente) REFERENCES PACIENTES (UsuarioPaciente),
  FOREIGN KEY (UsuarioDoctor) REFERENCES DOCTORES (UsuarioDoctor)
);

CREATE TABLE MEDICAMENTOS
(
  Id_Medicamento int NOT NULL,
  Nombre VARCHAR(30),
  Unidad VARCHAR(20),-- Tableta, Injection, Gotas

  PRIMARY KEY(Id_Medicamento)
);

CREATE TABLE DETALLEMEDICAMENTOS
(
  Id_DetalleMedicamento int NOT NULL,
  Id_Medicamento int NOT NULL,
  Id_Receta int NOT NULL,
  Cantidad int,-- 1
  Frecuencia int,-- 12 (Cada 12 hrs)
  FechaLimite DATE, -- Fecha límite para tomarlo

  PRIMARY KEY(Id_DetalleMedicamento),
  FOREIGN KEY (Id_Medicamento) REFERENCES Medicamentos (Id_Medicamento),
  FOREIGN KEY (Id_Receta) REFERENCES Recetas (Id_Receta)
);

CREATE TABLE CITAS
(
  Id_Cita int NOT NULL AUTO_INCREMENT,
  UsuarioPaciente VARCHAR(30) not null,
  UsuarioDoctor VARCHAR(30) not null,
  Fecha DATE,
  Hora TIME,
  Descripcion VARCHAR(50),
  Activa int,

  PRIMARY KEY(Id_Cita),
  FOREIGN KEY (UsuarioPaciente) REFERENCES PACIENTES (UsuarioPaciente),
  FOREIGN KEY (UsuarioDoctor) REFERENCES DOCTORES (UsuarioDoctor)
);

CREATE TABLE CONSULTORIOS
(
  Id_Consultorio int not null,
  Id_Ciudad int,
  Nombre VARCHAR(30),
  Telefono VARCHAR (10),
  Calle VARCHAR(30),
  CodigoPostal int,
  Correo VARCHAR(30),
  Activo int,

  PRIMARY KEY (Id_Consultorio),
  FOREIGN KEY (Id_Ciudad) REFERENCES CIUDADES (Id_Ciudad)
);

CREATE TABLE DOCTORESCONSULTORIOS
(
  Id_DoctorConsultorio int not null,
  UsuarioDoctor VARCHAR(30) not null,
  Id_Consultorio int not null,

  PRIMARY KEY (Id_DoctorConsultorio),
  FOREIGN KEY (UsuarioDoctor) REFERENCES DOCTORES (UsuarioDoctor),
  FOREIGN KEY (Id_Consultorio) REFERENCES CONSULTORIOS (Id_Consultorio)
);

CREATE TABLE DIASTRABAJO
(
  Id_DiaTrabajo int not null,
  Nombre VARCHAR(10),--Lunes, Martes, etc

  PRIMARY KEY(Id_DiaTrabajo)
)

CREATE TABLE DIASDOCTORESCONSULTORIOS
(
  Id_DiaDoctorConsultorio int not null,
  Id_DoctorConsultorio int not null,
  Id_DiaTrabajo int not null,

  PRIMARY KEY (Id_DiaDoctorConsultorio),
  FOREIGN KEY (Id_DoctorConsultorio) REFERENCES DOCTORESCONSULTORIOS (Id_DoctorConsultorio),
  FOREIGN KEY (Id_DiaTrabajo) REFERENCES DIASTRABAJO (Id_DiaTrabajo)
);

CREATE TABLE HORARIOSTRABAJO
(
  Id_HorarioTrabajo int not null,
  HoraInicial TIME not null,
  HoraFinal TIME not null,

  PRIMARY KEY(Id_HorarioTrabajo)
);

CREATE TABLE HORARIOSDIASTRABAJO
(
  Id_HorarioDiaTrabajo int not null,
  Id_DiaTrabajo int not null,
  Id_HorarioTrabajo int not null,

  PRIMARY KEY(Id_HorarioDiaTrabajo),
  FOREIGN KEY (Id_DiaTrabajo) REFERENCES DIASTRABAJO (Id_DiaTrabajo),
  FOREIGN KEY (Id_HorarioTrabajo) REFERENCES HORARIOSTRABAJO (Id_HorarioTrabajo)
);
