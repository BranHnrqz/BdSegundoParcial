create database HospitalVeterinario;
USE [HospitalVeterinario]
GO

CREATE TABLE [dbo].[PropietarioMascota](
	[NumIdentidadPropietario] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Nombre] [varchar] (50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Departamento] [varchar](50) NOT NULL,
	[CodigoPostal] [varchar](50) NOT NULL,
	)
GO

CREATE TABLE [dbo].[Mascota](
	[NumIdentidadMascota] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Nombre] [varchar] (50) NOT NULL,
	[Peso] [float](50) NOT NULL,
	[Observaciones] [varchar](50) NOT NULL,
	[NumIdentidadPropietario] [int] FOREIGN KEY (NumIdentidadPropietario) REFERENCES [dbo].[PropietarioMascota](NumIdentidadPropietario),
	)
GO

CREATE TABLE [dbo].[Veterinario](
	[IdVeterinario] [int] IDENTITY(1000,1) NOT NULL PRIMARY KEY,
	[Nombre] [varchar](50) NOT NULL,
	[Apellidos] [date] NOT NULL,
	[Cargo] [varchar](50) NOT NULL,
	)
GO

CREATE TABLE [dbo].[Ingresos](
	[IdIngresos] [int] IDENTITY(1000,1) NOT NULL PRIMARY KEY,
	[Motivo] [varchar](50) NOT NULL,
	[FechaIngreso] [date] NOT NULL,
	[Observaciones] [varchar] (50) NOT NULL,
	[NumIdentidadMascota] [int] FOREIGN KEY (NumIdentidadMascota) REFERENCES [dbo].[Mascota](NumIdentidadMascota),
	[IdVeterinario] [int] FOREIGN KEY (IdVeterinario) REFERENCES [dbo].[Veterinario](IdVeterinario),
	)
GO

/* Normalizando */
/* Numeros de Teléfono, ya que los dueños pueden tener más de uno */

CREATE TABLE [dbo].[Contacto](
	[IdContacto] [int] IDENTITY(200,1) NOT NULL PRIMARY KEY,
	[NumTelefono] [int],
	)
GO

/* Tabla creada para Relacionar la tabla "Contactos" con la tabla "PropietarioMascota" */
CREATE TABLE [dbo].[ContactoPropietario](
	[IdContactoPropietario] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[IdContacto] [int] FOREIGN KEY (IdContacto) REFERENCES [dbo].[Contacto](IdContacto),
	[NumIdentidadPropietario] [int] FOREIGN KEY (NumIdentidadPropietario) REFERENCES [dbo].[PropietarioMascota](NumIdentidadPropietario),
	)
GO

/* Raza de la Mascota (Ya que hay mascotas mezcladas, pueden tener más de una raza)*/
CREATE TABLE [dbo].[Raza](
	[IdRaza] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[NombreRaza] [varchar] (50) NOT NULL,
	)
GO

/* Tabla creada para Relacionar la tabla "Raza" con la tabla "Mascota" */
CREATE TABLE [dbo].[RazaMascota](
	[IdRazaMascota] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[IdRaza] [int] FOREIGN KEY (IdRaza) REFERENCES [dbo].[Raza](IdRaza),
	[NumIdentidadMascota] [int] FOREIGN KEY (NumIdentidadMascota) REFERENCES [dbo].[Mascota](NumIdentidadMascota),
	)
GO

/* Tipo de Mascota */
CREATE TABLE [dbo].[Tipo](
	[IdTipo] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Nombre] [varchar] (50) NOT NULL,
	)
GO

/* Tabla creada para Relacionar la tabla "Tipo" con la tabla "Mascota" */
CREATE TABLE [dbo].[TipoMascota](
	[IdTipoMascota] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[IdTipo] [int] FOREIGN KEY (IdTipo) REFERENCES [dbo].[Tipo](IdTipo),
	[NumIdentidadMascota] [int] FOREIGN KEY (NumIdentidadMascota) REFERENCES [dbo].[Mascota](NumIdentidadMascota),
	)
GO

/* Tabla para determinar los posibles Cargos que tendrán los Veterinarios */ 
CREATE TABLE [dbo].[Cargos](
	[IdCargo] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Nombre] [varchar] (50) NOT NULL,
	[IdVeterinario] [int] FOREIGN KEY (IdVeterinario) REFERENCES [dbo].[Veterinario](IdVeterinario),
	)
GO

/* Llenando datos */ 

/* Actualizacion de tipo de dato en "Veterinario" */
ALTER TABLE Veterinario ALTER COLUMN Apellidos varchar(50)

/* Tabla "Veterinarios" */
Insert into Veterinario(Nombre, Apellidos, Cargo)
Values ('Brandon','Henriquez','Estilista')

Insert into Veterinario(Nombre, Apellidos, Cargo)
Values ('Shigeru','Miyamoto', 'Emergencias')

Insert into Veterinario(Nombre, Apellidos, Cargo)
Values ('Satoru','Iwata','Laboratorio')

Insert into Veterinario(Nombre, Apellidos, Cargo)
Values ('Vladimir','Putin','Radiografia')


/* Tabla "PropietarioMascota" */
Insert into PropietarioMascota(Nombre, Apellidos, Direccion,Departamento,CodigoPostal)
Values ('Cristian','Lemus','La Ceiba','Chalatenango','10900')

Insert into PropietarioMascota(Nombre, Apellidos, Direccion,Departamento,CodigoPostal)
Values ('Michelle','Wright','Santa Elena','Chalatenango','10900')

/* Tabla "Contacto" */
Insert into Contacto (NumTelefono)
Values (78496283)

Insert into Contacto (NumTelefono)
Values (77267425)

/* Tabla "ContactoPropietario" */
Insert into ContactoPropietario(IdContacto,NumIdentidadPropietario)
Values (200,1)

Insert into ContactoPropietario(IdContacto,NumIdentidadPropietario)
Values (200,2)

/* Tabla "Mascota" */ 
Insert into Mascota(Nombre,Peso,Observaciones,NumIdentidadPropietario)
Values ('Allice','65','Traviesa',1)

Insert into Mascota(Nombre,Peso,Observaciones,NumIdentidadPropietario)
Values ('Chloe','2','Nerviosa',1)

Insert into Mascota(Nombre,Peso,Observaciones,NumIdentidadPropietario)
Values ('Tayson','40','Agresivo',2)

Insert into Mascota(Nombre,Peso,Observaciones,NumIdentidadPropietario)
Values ('Terry','26','Nervioso',1)

Insert into Mascota(Nombre,Peso,Observaciones,NumIdentidadPropietario)
Values ('Firulais','31','Pasivo',1)

Insert into Mascota(Nombre,Peso,Observaciones,NumIdentidadPropietario)
Values ('Cipi','40','Pasivo',1)

Insert into Mascota(Nombre,Peso,Observaciones,NumIdentidadPropietario)
Values ('Yupi','17','Nervioso',2)

Insert into Mascota(Nombre,Peso,Observaciones,NumIdentidadPropietario)
Values ('Mathiu','46','Pasivo',1)

Insert into Mascota(Nombre,Peso,Observaciones,NumIdentidadPropietario)
Values ('Neron','6','Agresivo',2)

Insert into Mascota(Nombre,Peso,Observaciones,NumIdentidadPropietario)
Values ('Kayser','17','Nervioso',2)

/* Tabla "Raza" */ 

Insert into Raza(NombreRaza)
Values ('Mestizo')

Insert into Raza(NombreRaza)
Values ('Pastor Aleman')

/* Tabla "RazaMascota" */ 

Insert into RazaMascota(IdRaza,NumIdentidadMascota)
Values (1,1)

Insert into RazaMascota(IdRaza,NumIdentidadMascota)
Values (2,2)

Insert into RazaMascota(IdRaza,NumIdentidadMascota)
Values (1,3)

Insert into RazaMascota(IdRaza,NumIdentidadMascota)
Values (2,4)

Insert into RazaMascota(IdRaza,NumIdentidadMascota)
Values (2,5)

Insert into RazaMascota(IdRaza,NumIdentidadMascota)
Values (2,6)

Insert into RazaMascota(IdRaza,NumIdentidadMascota)
Values (1,7)

Insert into RazaMascota(IdRaza,NumIdentidadMascota)
Values (1,8)

Insert into RazaMascota(IdRaza,NumIdentidadMascota)
Values (2,9)

Insert into RazaMascota(IdRaza,NumIdentidadMascota)
Values (2,10)

/* "Tabla Tipo" */
Insert into Tipo (Nombre)
Values ('Gato')

Insert into Tipo (Nombre)
Values ('Perro')

/* "Tabla TipoMascota" */
Insert into TipoMascota (IdTipo,NumIdentidadMascota)
Values (1,1)

Insert into TipoMascota (IdTipo,NumIdentidadMascota)
Values (1,2)

Insert into TipoMascota (IdTipo,NumIdentidadMascota)
Values (2,3)

Insert into TipoMascota (IdTipo,NumIdentidadMascota)
Values (2,4)

Insert into TipoMascota (IdTipo,NumIdentidadMascota)
Values (1,5)

Insert into TipoMascota (IdTipo,NumIdentidadMascota)
Values (2,6)

Insert into TipoMascota (IdTipo,NumIdentidadMascota)
Values (1,7)

Insert into TipoMascota (IdTipo,NumIdentidadMascota)
Values (2,8)

Insert into TipoMascota (IdTipo,NumIdentidadMascota)
Values (1,9)

Insert into TipoMascota (IdTipo,NumIdentidadMascota)
Values (1,10)

/* Tabla "Ingresos" */ 
Insert into Ingresos(Motivo,FechaIngreso,Observaciones,NumIdentidadMascota,IdVeterinario)
Values ('Vomitos','2021-10-19','Estable',6,1000)

Insert into Ingresos(Motivo,FechaIngreso,Observaciones,NumIdentidadMascota,IdVeterinario)
Values ('Mareos','2021-11-1','Grave',3,1000)

Insert into Ingresos(Motivo,FechaIngreso,Observaciones,NumIdentidadMascota,IdVeterinario)
Values ('Dolor de Patitas','2021-07-3','Moderado',7,1000)

Insert into Ingresos(Motivo,FechaIngreso,Observaciones,NumIdentidadMascota,IdVeterinario)
Values ('Ceguera','2021-11-1','Moderado',10,1003)

Insert into Ingresos(Motivo,FechaIngreso,Observaciones,NumIdentidadMascota,IdVeterinario)
Values ('Rabia','2021-08-3','Estable',1,1002)

Insert into Ingresos(Motivo,FechaIngreso,Observaciones,NumIdentidadMascota,IdVeterinario)
Values ('Embarazo','2021-08-7','Estable',2,1001)

Insert into Ingresos(Motivo,FechaIngreso,Observaciones,NumIdentidadMascota,IdVeterinario)
Values ('Embarazo','2021-10-30','Grave',3,1003)

Insert into Ingresos(Motivo,FechaIngreso,Observaciones,NumIdentidadMascota,IdVeterinario)
Values ('Mordidas','2021-11-1','Moderado',4,1002)

Insert into Ingresos(Motivo,FechaIngreso,Observaciones,NumIdentidadMascota,IdVeterinario)
Values ('Problemas de Apetito','2021-09-2','Estable',5,1001)

Insert into Ingresos(Motivo,FechaIngreso,Observaciones,NumIdentidadMascota,IdVeterinario)
Values ('Vomito','2021-10-25','Estable',6,1002)

Insert into Ingresos(Motivo,FechaIngreso,Observaciones,NumIdentidadMascota,IdVeterinario)
Values ('Gastritis','2021-10-6','Moderado',7,1002)

Insert into Ingresos(Motivo,FechaIngreso,Observaciones,NumIdentidadMascota,IdVeterinario)
Values ('Esterilizacion','2021-10-17','Grave',8,1003)

Insert into Ingresos(Motivo,FechaIngreso,Observaciones,NumIdentidadMascota,IdVeterinario)
Values ('Parvovirus','2021-10-26','Grave',9,1001)

Insert into Ingresos(Motivo,FechaIngreso,Observaciones,NumIdentidadMascota,IdVeterinario)
Values ('Mareos','2021-11-1','Moderado',10,1002)
