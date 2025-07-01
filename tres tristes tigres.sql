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
 #impedir correo y numero de documentos repetidos 
 # este ejecuta antes de insertar un usuario si encuentra datos ya existentes lo cancela 
 DELIMITER //
 CREATE TRIGGER mostrarrepetidos
 BEFORE INSERT ON Usuarios
 FOR EACH ROW 
 BEGIN 
 DECLARE doc INT;
 DECLARE correo INT;
 SELECT COUNT(*) INTO doc
 FROM Usuarios
 WHERE Num_Doc = NEW.Num_Doc;
 SELECT count(*) into correo
 FROM Usuarios
 WHERE Correo = NEW.Correo;
 IF doc > 0 THEN 
 SIGNAL SQLSTATE '45000'
 SET MESSAGE_TEXT = " ERROR : el numero de documento ya esta registrado";
 END IF ;
 IF correo > 0 THEN 
 SIGNAL SQLSTATE '45000'
 SET MESSAGE_TEXT = "ERROR : el correo ya esta registrado" ;
 END IF;
 END //
 
 DELIMITER ;
 # verficar si el espacio esta disponible 
 DELIMITER //
 CREATE TRIGGER disponible
 BEFORE INSERT ON Solicitudes
 FOR each row
 BEGIN
 DECLARE taocupaoo INT;
 DECLARE hora_inicio TIME;
DECLARE tiempo_uso TIME;
 SELECT e.Hora_Soli, e.Tiem_Uso INTO hora_inicio, tiempo_uso
 FROM Espacio_publico e
 WHERE e.Id_espacio = NEW.Id_espa;
 SELECT COUNT(*) into taocupaoo
 FROM Solicitudes s
 JOIN Espacio_publico e ON s.Id_espa = e.Id_espacio
 WHERE S.Id_espa = NEW.id_espa
AND ((hora_inicio BETWEEN e.Hora_Soli AND ADDTIME(e.Hora_Soli, e.Tiem_Uso)) OR
(ADDTIME(hora_inicio, tiempo_uso) BETWEEN e.Hora_Soli AND ADDTIME(e.Hora_Soli, e.Tiem_Uso))
);
IF taocupaoo > 0 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'El espacio ya está reservado en este horario';
END IF;
END //
DELIMITER ;