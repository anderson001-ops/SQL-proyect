DROP DATABASE IF EXISTS Proyecto;
CREATE DATABASE Proyecto;
USE Proyecto;

CREATE TABLE Usuarios(
	Id_usuario INT(5) PRIMARY KEY AUTO_INCREMENT,
	Nom_Usu  VARCHAR(50),
	Ape_Usu  VARCHAR(50),
	Correo  VARCHAR(100),
	Num_Doc  INT(15),
	Pasword  VARCHAR(30),
	Estado  VARCHAR(10),
	Id_document  INT(5)
);
CREATE TABLE Tip_document(
	Id_document  INT(5) PRIMARY KEY AUTO_INCREMENT,
    Tipo_Doc VARCHAR(30)
);

ALTER TABLE Usuarios
ADD CONSTRAINT Id_document
FOREIGN KEY (Id_document) REFERENCE Usuarios(Id_document);
