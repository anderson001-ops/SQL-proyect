# Inserción tipos de documento
INSERT INTO Tip_document (Tipo_Doc) VALUES
('Cédula de Ciudadanía'),
('Pasaporte'),
('Cédula de Extranjería');
# Inserción de Usuarios
CALL Usuarios ("Anderson", "Capera", "joelcapera@gmail.com","1078596125", "com25la","Activo", "2");
CALL Usuarios ("Alejandro", "Bernal", "alejandrobernal@gmail.com","1023659874", "salcipapa123","Activo","1");
CALL Usuarios ("Mateo", "Suarez", "mateosuarez@gmail.com","1035872642", "Jr10pas","Activo","3");
CALL Usuarios ("Carlos", "Camacho", "carloscam@gmail.com","1032163105", "c4r10s301","Activo","1");
CALL Usuarios ("Nicolas PP", "Niño", "nicolasn@gmail.com","1013465955", "12c#;i1","Activo","2");
SELECT * FROM Usuarios;

#Vita usuarios con id documento =2
CREATE VIEW Usua AS
SELECT Id_usuario , Nom_Usu  , Ape_Usu , Correo, Num_Doc, Pasword, Estado, Id_document       
FROM Usuarios
WHERE Id_document = 2 ;
SELECT * FROM Usua;


#Inserción de accesorios
INSERT INTO Accesorios (Cant, Nom_acce, Marca, Num_serie) VALUES
(10, 'Cable internet', 'AmazonBasics','13A21'),
(15, 'Mouse', 'Logitech','1AE'),
(8, 'Teclado', 'Microsoft','13A21'),
(20, 'Monitor', 'Anker','A213'),
(12, 'Cable HDMI', 'Sony','TER32');
SELECT*FROM Accesorios;
#Inserción Roles
INSERT INTO Roles (Nom_rol) VALUES
("Instructor"),
("Administrador"),
("Tecnico");
#Inserción Espacio_publico
INSERT INTO Espacio_publico (Nom_Espa, Tiem_Uso, Hora_Soli, Num_Ficha) VALUES
('Auditorio ', '02:00:00', '09:00:00', 1001157),
('Cancha de Baloncesto', '01:30:00', '14:00:00', 1475002),
('Sala de Conferencias 1', '03:00:00', '10:30:00', 1003963),
('Salón de Usos Múltiples', '04:00:00', '08:00:00', 1022804);
#insercion categoria
INSERT INTO Categoria (Categoria) VALUES
('Portátiles'),
('Equipo de mesa'),
('Televisores');

SELECT * FROM Usuarios;

#insertar solicitudes
CALL Solicitudes (1, 2, 2, "Buen funcionamiento", '2025-07-09', '2025-08-09', "Activo", "003");
SELECT * FROM Solicitudes;

#Insertar elemento
CALL Elemento ("Teclado", "Todas las teclas funcionan bien","1","2");
SELECT * FROM Elemento;
#estado ticket 
CALL Estado_ticket (1,"Cambio de bateria y actualizacion de sistema operativo","inactivo");
SELECT*FROM Estado_ticket;
#insertar ticket
CALL Tickets('2025-07-01', '2025-07-09', 'Auditorio', 1, 1, 2);

INSERT INTO Prestamos_Elemento (Id_prestamo, Id_elemento) VALUES (1, 1);


SELECT*FROM Tickets;
#Prestamos
CALL Prestamos (1,"2025-06-05 06:00:00  ","2025-06-05 12:30:00","Portatil","Cancha");
CALL Prestamos (2,"2025-06-10 1:30:00 ","2025-06-10 06:00:00","Equipos_de_mesa","Auditorio");
CALL Prestamos (3,"2025-06-13 2:00:00 ","2025-06-13 06:00:00","Portatil","Cancha");
CALL Prestamos (4,"2025-06-25 10:20:00 ","2025-06-25 06:00:00","Portatil","Auditorio");
CALL Prestamos (5,"2025-07-07 09:10:00 ","2025-07-07 06:00:00","Portatil","Cancha");
SELECT*FROM Prestamos;

#Vista prestamos
CREATE VIEW Prestt AS
SELECT Id_prestamo , Fecha_entre , Fecha_recep , Tipo_prest , Espa_public , Id_User    
FROM Prestamos
WHERE Tipo_prest = "Portatil"; 
SELECT * FROM Prestt ;

CALL Tickets_elemento (1,1,"El equipo de escritoria revisado presentaba fallas en la licencia de office");
SELECT*FROM Tickets_elemento;
#estado ticket 
CALL Estado_ticket (1,"Cambio de bateria y actualizacion de sistema operativo","inactivo");
SELECT*FROM Estado_ticket;
#ejemplo de que sirve el trigers
#contraseña encriptada 
INSERT INTO Usuarios (Nom_Usu, Ape_Usu, Correo, Num_Doc, Pasword, Estado, Id_document) 
VALUES ('Jhon', 'jairo', 'jhonjairito@gmail.com', 123456789, 'jhonjairito123', 'Activo', 1);
#ver que sirve 
SELECT Id_usuario, Nom_Usu, Pasword FROM Usuarios WHERE Num_Doc = 123456789;
#repetidos documentos y correos 
INSERT INTO Usuarios (Nom_Usu, Ape_Usu, Correo, Num_Doc, Pasword, Estado, Id_document) 
VALUES ('Pedro', 'Gomez', 'pedro@example.com', 1078596125, 'password123', 'Activo', 1);
INSERT INTO Usuarios (Nom_Usu, Ape_Usu, Correo, Num_Doc, Pasword, Estado, Id_document) 
VALUES ('Maria', 'Lopez', 'joelcapera@gmail.com', 987654321, 'password456', 'Activo', 1);
# verficar espacio disponible 
# miramos espacios 
SELECT * FROM Espacio_publico;
# insertamos espacio ya ocupao
INSERT INTO Solicitudes (Cantidad, Id_usua, Id_espa)
VALUES (5, 1, 1);
-- Asignamos el elemento 1 al préstamo 1 (ocupado del 2025-06-05 06:00 a 12:30)
INSERT INTO Prestamos_Elemento (Id_prestamo, Id_elemento) VALUES (1, 1);
SELECT verificar_disponibilidad_elementos(1, '2025-06-05 07:00:00', '2025-06-05 08:00:00') AS Disponibilidad;
SELECT      e.Id_elemento,     e.Nom_element,     verificar_disponibilidad_elementos(e.Id_elemento, '2025-07-05 10:00:00', '2025-07-05 11:00:00') AS Disponibilidad FROM Elemento e;
SELECT Verificar_disponibilidad_espacio(2, '2025-08-10 09:00:00', '2025-08-10 12:00:00') AS Disponibilidad;
SELECT Verificar_disponibilidad_espacio(2, '2025-06-10 02:00:00', '2025-06-10 05:00:00') AS Disponibilidad;


