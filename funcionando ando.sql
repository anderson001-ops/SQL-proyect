USE `proyecto`;
DROP function IF EXISTS `verificar_disponibilidad_elementos`;

USE `proyecto`;
DROP function IF EXISTS `proyecto`.`verificar_disponibilidad_elementos`;
;

DELIMITER $$
USE `proyecto`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `verificar_disponibilidad_elementos`(elemento_id INT,
    fecha_inicio DATETIME,
    fecha_fin DATETIME
) RETURNS varchar(20) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
DECLARE ocupado INT ;

        SELECT COUNT(*)
    INTO ocupado
    FROM Prestamos_Elemento AS prest_e
    JOIN Prestamos AS prest ON prest_e.Id_prestamo = prest.Id_prestamo
    WHERE prest_e.Id_elemento = elemento_id
      AND (
            (prest.Fecha_entre <= fecha_inicio AND prest.Fecha_recep >= fecha_inicio) OR
            (prest.Fecha_entre <= fecha_fin AND prest.Fecha_recep >= fecha_fin) OR
            (prest.Fecha_entre >= fecha_inicio AND prest.Fecha_recep <= fecha_fin)
          );
 IF ocupado > 0 THEN
        RETURN 'No disponible';
    ELSE
        RETURN 'Disponible';
    END IF ; 
    
END$$

DELIMITER ;
;

USE `proyecto`;
DROP function IF EXISTS `Verificar_disponibilidad_espacio`;

USE `proyecto`;
DROP function IF EXISTS `proyecto`.`Verificar_disponibilidad_espacio`;
;

DELIMITER $$
USE `proyecto`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `Verificar_disponibilidad_espacio`(espacio_id INT,
    fecha_inicio DATETIME,
    fecha_fin DATETIME) RETURNS varchar(20) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
DECLARE ocupado INT;

    SELECT COUNT(*)
    INTO ocupado
    FROM Prestamos AS prest
    JOIN Solicitudes AS soli ON prest.Id_User = soli.Id_usua
    WHERE soli.Id_espa = espacio_id
      AND (
            (prest.Fecha_entre <= fecha_inicio AND prest.Fecha_recep >= fecha_inicio) OR
            (prest.Fecha_entre <= fecha_fin AND prest.Fecha_recep >= fecha_fin) OR
            (prest.Fecha_entre >= fecha_inicio AND prest.Fecha_recep <= fecha_fin)
          );
     IF ocupado > 0 THEN
        RETURN 'No disponible';
    ELSE
        RETURN 'Disponible';
    END IF;
END$$

DELIMITER ;
;

