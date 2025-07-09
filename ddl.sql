DROP DATABASE IF EXISTS Proyecto;
CREATE DATABASE Proyecto;
USE Proyecto;

CREATE TABLE Usuarios(
	Id_usuario INT(5) PRIMARY KEY AUTO_INCREMENT,
	Nom_Usu  VARCHAR(50),
	Ape_Usu  VARCHAR(50),
	Correo  VARCHAR(100),
	Num_Doc  INT(15) UNIQUE,
	Pasword  VARCHAR(500),
	Estado VARCHAR(15),
	Id_document  INT(5)
);

CREATE TABLE Tip_document(
	Id_documento  INT(5) PRIMARY KEY AUTO_INCREMENT,
    Tipo_Doc VARCHAR(30)
);

CREATE TABLE Prestamos(
	Id_prestamo INT(5) PRIMARY KEY AUTO_INCREMENT,
	Fecha_entre TIMESTAMP NULL,
	Fecha_recep TIMESTAMP NULL,
	Tipo_prest VARCHAR(30) NULL,
	Espa_public VARCHAR (30),
	Id_User INT(5)
);

CREATE TABLE Tickets(
	Id_ticket INT(5) PRIMARY KEY AUTO_INCREMENT,
	Fecha_ini DATE ,
    Fecha_finn DATE ,
    Ambiente VARCHAR (25),
	Revision_tick INT(10),
    Estado INT (10),
    Id_usu INT(5)
);

CREATE TABLE Solicitudes(
	Id_solicitud INT (5) PRIMARY KEY AUTO_INCREMENT,
	Cantidad INT (5),
    Observacion VARCHAR(25),
    Fecha_inicio DATE,
    Fecha_fin DATE,
    Estad0 VARCHAR (25),
    Ambiente VARCHAR(25),
	Id_usua INT (5),
	Id_espa INT (5)
);

CREATE TABLE Espacio_publico(
Id_espacio INT (5) PRIMARY KEY AUTO_INCREMENT,
Nom_Espa VARCHAR(255),
Tiem_Uso TIME(6),
Hora_Soli TIME(6),
Num_Ficha INT(10)
);

CREATE TABLE Roles_Usuarios(
	Id_roles INT(5),
    Id_Usuario INT(5),
    PRIMARY KEY (Id_roles,Id_Usuario)
    );

CREATE TABLE Roles(
	Id_roles INT(5) PRIMARY KEY AUTO_INCREMENT,
    Nom_rol VARCHAR(50)
    );

CREATE TABLE Elemento_Solicitudes(
	Id_elemento INT(5),
    Id_solicitud INT(5),
    PRIMARY KEY (Id_elemento,Id_solicitud)
);

CREATE TABLE Elemento(
	Id_elemento INT(5) PRIMARY KEY AUTO_INCREMENT,
	Nom_element VARCHAR(30),
	Obser VARCHAR(150),
	Id_acceso INT(5),
	Id_catego INT(5)
);

CREATE TABLE Prestamos_Elemento(
	Id_prestamo INT(5),
	Id_elemento INT(5),
PRIMARY KEY (Id_prestamo,Id_elemento)
);

CREATE TABLE Accesorios(
Id_accesorios INT(5) PRIMARY KEY AUTO_INCREMENT,
Cant INT(2),
Nom_acce VARCHAR(30),
Marca VARCHAR (20),
Num_serie VARCHAR (15)
);

CREATE TABLE Categoria(
Id_categoria INT (5) PRIMARY KEY AUTO_INCREMENT,
Categoria VARCHAR(30)
);

CREATE TABLE Estado_ticket(
Id_estado INT(10)PRIMARY KEY AUTO_INCREMENT,
Nom_estado VARCHAR (20),
Historial VARCHAR(255),
Id_cat INT(5)
);

CREATE TABLE Tickets_Elemento(
Id_ticket INT(5),
Id_elemento INT(5),
Obser_ticket VARCHAR(255)
);

ALTER TABLE Usuarios
ADD CONSTRAINT Id_document
FOREIGN KEY (Id_document) REFERENCES Tip_document(Id_documento);

ALTER TABLE Prestamos
ADD CONSTRAINT Id_User
FOREIGN KEY (Id_User) REFERENCES Usuarios(Id_usuario);

ALTER TABLE Tickets
ADD CONSTRAINT Id_usu
FOREIGN KEY (Id_usu) REFERENCES Usuarios(Id_usuario);

ALTER TABLE Tickets
ADD CONSTRAINT Fk_Estad
FOREIGN KEY (Estado) REFERENCES Estado_ticket(Id_estado);

ALTER TABLE Estado_ticket
ADD CONSTRAINT Id_cat
FOREIGN KEY (Id_cat) REFERENCES Categoria(Id_categoria);

ALTER TABLE Elemento
ADD CONSTRAINT Id_catego
FOREIGN KEY (Id_catego) REFERENCES Categoria(Id_categoria);

ALTER TABLE Elemento
ADD CONSTRAINT Id_acceso
FOREIGN KEY (Id_acceso) REFERENCES Accesorios(Id_accesorios);

ALTER TABLE Solicitudes
ADD CONSTRAINT Id_usua
FOREIGN KEY (Id_usua) REFERENCES Usuarios(Id_usuario);
 
ALTER TABLE Solicitudes
ADD CONSTRAINT FK_EspacioSolicitudes
FOREIGN KEY (Id_espa) REFERENCES Espacio_publico(Id_espacio);

ALTER TABLE Elemento_Solicitudes
ADD CONSTRAINT Id_elemento
FOREIGN KEY (Id_elemento) REFERENCES Elemento(Id_elemento);

ALTER TABLE Elemento_Solicitudes
ADD CONSTRAINT Id_solicitud
FOREIGN KEY (Id_solicitud) REFERENCES Solicitudes(Id_solicitud);

ALTER TABLE Roles_Usuarios
ADD CONSTRAINT Id_roles
FOREIGN KEY (Id_roles) REFERENCES Roles(Id_roles);

ALTER TABLE Roles_Usuarios
ADD CONSTRAINT Id_Usuario
FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id_usuario);

ALTER TABLE Tickets_Elemento
ADD CONSTRAINT Fk_Ticketss
FOREIGN KEY (Id_ticket) REFERENCES Tickets(Id_ticket);

ALTER TABLE Tickets_Elemento
ADD CONSTRAINT Fk_Tickets_element
FOREIGN KEY (Id_elemento) REFERENCES Elemento(Id_elemento);

ALTER TABLE Prestamos_Elemento
ADD CONSTRAINT FK_Prest_
FOREIGN KEY (Id_prestamo) REFERENCES Prestamos(Id_prestamo);

ALTER TABLE Prestamos_Elemento
ADD CONSTRAINT Fk_eleme
FOREIGN KEY (Id_elemento) REFERENCES Elemento(Id_elemento);

