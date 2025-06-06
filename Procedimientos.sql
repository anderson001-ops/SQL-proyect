USE `proyecto`;
DROP procedure IF EXISTS `Usuarios`;

DELIMITER $$
USE `proyecto`$$
CREATE PROCEDURE `Usuarios` (
	IN Nom_Usu VARCHAR(50), 
	IN Ape_Usu VARCHAR(50), 
	IN Correo VARCHAR(100), 
	IN Num_Doc INT(15), 
	IN Pasword VARCHAR(30), 
	IN Id_est INT(5), 
	IN Id_document INT(5)
)
BEGIN
	INSERT INTO Usuarios (Nom_Usu,Ape_Usu,Correo,Num_Doc,Pasword,Id_est,Id_document)
	VALUES (Nom_Usu,Ape_Usu,Correo,Num_Doc,Pasword,Id_est,Id_document);
END$$

DELIMITER ;

#Solicitudes
USE `proyecto`;
DROP procedure IF EXISTS `Solicitudes`;

DELIMITER $$
USE `proyecto`$$
CREATE PROCEDURE `Solicitudes` (
	IN Cantidad INT(5),
	IN Id_usua INT(5),
    IN Id_espa INT(5)
)
BEGIN
	INSERT INTO Solicitudes (Cantidad,Id_usua,Id_espa)
	VALUES (Cantidad,Id_usua,Id_espa);
END$$

DELIMITER ;

#Elemento
USE `proyecto`;
DROP procedure IF EXISTS `Elemento`;

DELIMITER $$
USE `proyecto`$$
CREATE PROCEDURE `Elemento` (
	IN Nom_element VARCHAR(30), 
	IN Obser VARCHAR(150), 
	IN Num_Serie INT(15),
    IN Id_acceso INT(5),
	IN Id_catego INT(5)
)
BEGIN
	INSERT INTO Elemento (Nom_element,Obser,Num_Serie,Id_acceso,Id_catego)
	VALUES (Nom_element,Obser,Num_Serie,Id_acceso,Id_catego);
END$$

DELIMITER ;

#tickets
USE `proyecto`;
DROP procedure IF EXISTS `Tickets`;

DELIMITER $$
USE `proyecto`$$
CREATE PROCEDURE `Tickets` (
	IN Fecha_Repor DATE,
	IN Estado VARCHAR (20),
	IN Id_usu INT(5)
)
BEGIN
	INSERT INTO Tickets (Fecha_Repor,Estado,Id_usu)
	VALUES (Fecha_Repor,Estado,Id_usu);
END$$

DELIMITER ;

#Prestamos
USE `Proyecto`;
DROP PROCEDURE IF EXISTS `Prestamos`;

DELIMITER $$
CREATE PROCEDURE `Prestamos` (
    IN Id_user INT(5),
    IN Fecha_entre TIMESTAMP,
    IN Fecha_recep TIMESTAMP,
    IN Tipo_prest VARCHAR(30),
    IN Espa_public VARCHAR(30)
)
BEGIN
    INSERT INTO Prestamos (Id_user,Fecha_entre,Fecha_recep,Tipo_prest,Espa_public)
    VALUES (Id_user,Fecha_entre,Fecha_recep,Tipo_prest,Espa_public);
END$$
DELIMITER ;

#Prestamos
USE `Proyecto`;
DROP PROCEDURE IF EXISTS `Tickets_elemento`;

DELIMITER $$
CREATE PROCEDURE `Tickets_elemento` (
	IN Id_ticket INT(5), 
	IN Id_elemento INT(5), 
	IN Obser_ticket VARCHAR(255)
)
BEGIN
    INSERT INTO Tickets_elemento (Id_ticket,Id_elemento,Obser_ticket)
    VALUES (Id_ticket,Id_elemento,Obser_ticket);
END$$
DELIMITER ;




