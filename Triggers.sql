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
# si el elemento esta disponible 
 DELIMITER //

CREATE TRIGGER verificar_elemento_disponible
BEFORE INSERT ON Prestamos_Elemento
FOR EACH ROW
BEGIN
    DECLARE disponibilidad VARCHAR(20);
    DECLARE fecha_inicio DATETIME;
    DECLARE fecha_fin DATETIME;

    -- Obtener fechas del préstamo asociado
    SELECT Fecha_entre, Fecha_recep
    INTO fecha_inicio, fecha_fin
    FROM Prestamos
    WHERE Id_prestamo = NEW.Id_prestamo;

    -- Llamada a la función verificar_disponibilidad_elementos
    SET disponibilidad = verificar_disponibilidad_elementos(
        NEW.Id_elemento,
        fecha_inicio,
        fecha_fin
    );

    -- Si no está disponible, cancelar la inserción
    IF disponibilidad = 'No disponible' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERROR: El elemento no está disponible en el rango de fechas solicitado';
    END IF;
END //

DELIMITER ;