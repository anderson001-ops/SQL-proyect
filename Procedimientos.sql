USE `proyecto`;
DROP procedure IF EXISTS `Usuario`;

DELIMITER $$
USE `proyecto`$$
CREATE PROCEDURE `Usuario` (
	IN Nom_Usu VARCHAR(50), 
	IN Ape_Usu VARCHAR(50), 
	IN Correo VARCHAR(100), 
	IN Num_Doc INT(15), 
	IN Pasword VARCHAR(30), 
	IN Estado VARCHAR(10), 
	IN Id_document INT(5)
)
BEGIN
	INSERT INTO Usuarios (Nom_Usu,Ape_Usu,Correo,Num_Doc,Pasword,Estado,Id_document)
	VALUES (Id_usuario,Nom_Usu,Ape_Usu,Correo,Num_Doc,Pasword,Estado,Id_document);
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
	VALUES (Id_solicitud,Cantidad,Id_usua,Id_espa);
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
	IN Num_Serie INT(10), 
	IN Id_acceso INT(5),
	IN Id_catego INT(5)
)
BEGIN
	INSERT INTO Elemento (Nom_element,Obser,Num_Serie,Id_acceso,Id_catego)
	VALUES (Nom_element,Obser,Num_Serie,Id_acceso,Id_catego);
END$$

DELIMITER ;