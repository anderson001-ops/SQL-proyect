USE `proyecto`;
DROP procedure IF EXISTS `proyecto`.`Usuarios`;
;

DELIMITER $$
USE `proyecto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Usuarios`(
	IN Nom_Usu VARCHAR(50), 
	IN Ape_Usu VARCHAR(50), 
	IN Correo VARCHAR(100), 
	IN Num_Doc INT(15), 
	IN Pasword VARCHAR(500),
	IN Estado VARCHAR(15),
	IN Id_document INT(5)
)
BEGIN
	INSERT INTO Usuarios (Nom_Usu,Ape_Usu,Correo,Num_Doc,Pasword,Estado,Id_document)
	VALUES (Nom_Usu,Ape_Usu,Correo,Num_Doc,Pasword, Estado,Id_document);
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
    IN Id_espa INT(5),
    IN Observacion VARCHAR(25), 
	IN Fecha_inicio DATE, 
	IN Fecha_fin DATE, 
	IN Estad0 VARCHAR(25), 
	IN Ambiente VARCHAR(25)
)
BEGIN
	INSERT INTO Solicitudes (Cantidad,Id_usua,Id_espa,Observacion,Fecha_inicio,Fecha_fin,Estad0,Ambiente)
	VALUES (Cantidad,Id_usua,Id_espa,Observacion,Fecha_inicio,Fecha_fin,Estad0,Ambiente);
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
    IN Id_acceso INT(5),
	IN Id_catego INT(5)
)
BEGIN
	INSERT INTO Elemento (Nom_element,Obser,Id_acceso,Id_catego)
	VALUES (Nom_element,Obser,Id_acceso,Id_catego);
END$$

DELIMITER ;

#tickets
USE `proyecto`;
DROP procedure IF EXISTS `Tickets`;

DELIMITER $$
USE `proyecto`$$
CREATE PROCEDURE `Tickets` (
	IN Fecha_ini DATE, 
	IN	Fecha_finn DATE, 
	IN	Ambiente VARCHAR(25),
	IN	Revision_tick INT(10),
	IN Estado INT (10),
	IN Id_usu INT(5)
)
BEGIN
	INSERT INTO Tickets (Fecha_ini,Fecha_finn,Ambiente,Revision_tick,Estado,Id_usu)
	VALUES (Fecha_ini,Fecha_finn,Ambiente,Revision_tick,Estado,Id_usu);
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

USE `proyecto`;
DROP procedure IF EXISTS `Estado_ticket`;

DELIMITER $$
USE `proyecto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Estado_ticket` (
IN Id_cat INTEGER(5),
IN Historial VARCHAR(255),
IN Nom_estado VARCHAR(15)
)
BEGIN
 INSERT INTO Estado_ticket(Id_cat,Historial,Nom_estado)
 VALUES (Id_cat,Historial,Nom_estado);
END$$

DELIMITER ;