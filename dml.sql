# Inserción tipos de documento
INSERT INTO Tip_document (Tipo_Doc) VALUES
('Cédula de Ciudadanía') ,
('Pasaporte'),
('Cédula de Extranjería');
# Inserción de Usuarios
CALL Usuarios ("Anderson", "Capera", "joelcapera@gmail.com","1078596125", "com25la","Activo", "2");
CALL Usuarios ("Alejandro", "Bernal", "alejandrobernal@gmail.com","1023659874", "salcipapa123","Activo","1");
CALL Usuarios ("Mateo", "Suarez", "mateosuarez@gmail.com","1035872642", "Jr10pas","Activo","3");
CALL Usuarios ("Carlos", "Camacho", "carloscam@gmail.com","1032163105", "c4r10s301","Activo","1");
CALL Usuarios ("Nicolas PP", "Niño", "nicolasn@gmail.com","1013465955", "12c#;i1","Activo","2");
SELECT * FROM Usuarios;

#Inserción de accesorios
INSERT INTO Accesorios (Cant, Nom_acce, Marca) VALUES
(10, 'Cable internet', 'AmazonBasics'),
(15, 'Mouse', 'Logitech'),
(8, 'Teclado', 'Microsoft'),
(20, 'Monitor', 'Anker'),
(12, 'Cable HDMI', 'Sony');
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
#insertar solicitudes
CALL Solicitudes (2,1,1);
SELECT * FROM Solicitudes;
#Insertar elemento
CALL Elemento ("Teclado", "Todas las teclas funcionan bien", "178935748921","1","2");
SELECT * FROM Elemento;
#estado ticket 
CALL Estado_ticket (1,"Cambio de bateria y actualizacion de sistema operativo","inactivo");
SELECT*FROM Estado_ticket;
#insertar ticket
CALL Tickets ('2025-06-04',1,1);
SELECT*FROM Tickets;
#Prestamos
CALL Prestamos (1,"2025-06-05 06:00:00  ","2025-06-05 12:30:00","Portatil","Cancha");
CALL Prestamos (2,"2025-06-10 1:30:00 ","2025-06-10 06:00:00","Equipos_de_mesa","Auditorio");
CALL Prestamos (3,"2025-06-13 2:00:00 ","2025-06-13 06:00:00","Portatil","Cancha");
CALL Prestamos (4,"2025-06-25 10:20:00 ","2025-06-25 06:00:00","Portatil","Auditorio");
CALL Prestamos (5,"2025-07-07 09:10:00 ","2025-07-07 06:00:00","Portatil","Cancha");
SELECT*FROM Prestamos;
CALL Tickets_elemento (1,1,"El equipo de escritoria revisado presentaba fallas en la licencia de office");
SELECT*FROM Tickets_elemento;
#estado ticket 
CALL Estado_ticket (1,"Cambio de bateria y actualizacion de sistema operativo","inactivo");
SELECT*FROM Estado_ticket;
