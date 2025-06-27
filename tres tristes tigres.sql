# para encriptar contraseñas auto 
DELIMITER //
CREATE TRIGGER encriptar
BEFORE INSERT ON Usuarios
FOR EACH ROW
BEGIN
IF NEW.pasword NOT LIKE 'encrypted%' THEN 
SET NEW.pasword = AES_ENCRYPT(NEW.pasword,'clave');
END IF;
END //
DELIMITER ;
#cambios de historial en elemento
 DELIMITER //
 CREATE TRIGGER cambiosdeelemento
 AFTER UPDATE ON Elemento
 FOR EACH ROW
 BEGIN
 IF OLD.Nom_element !=NEW.Nom_element OR  OLD.Obser !=NEW.obser THEN
 INSERT INTO  historial_Elementos (Id_elemento,cambiar,fecha,Usuario)
 VALUES (NEW.Id_elemento,
 concat('nombre:',OLD.Nom_element,'-', NEW.Nom_element,
 'observacion', OLD.obser,'-',NEW.Obser),
 NOW(),current_user());
 END IF;
 END //
 DELIMITER ;
 #
