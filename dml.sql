# Inserción tipos de documento
INSERT INTO Tip_document (Tipo_Doc) VALUES
('Cédula de Ciudadanía'),
('Pasaporte'),
('Cédula de Extranjería');
# Inserción de Usuarios
CALL Usuarios ("Anderson", "Capera", "joelcapera@gmail.com", "1034596125"); 
# Inserción de prestamos
INSERT INTO Prestamos (Fecha_entre, Fecha_recep, Tipo_prest, Espa_public, Id_user) VALUES
('2025-05-20 10:00:00', '2025-05-20 12:00:00', ' Cancha Deportivoa', 'cancha', "1" ),
('2025-05-21 14:30:00', '2025-05-21 17:00:00', 'Auditorio', 'auditorio', "2"),
('2025-05-22 09:00:00', '2025-05-22 11:00:00', 'Auditoio', 'auditorio', "3"),
('2025-05-23 11:00:00', '2025-05-23 13:00:00', ' Cancha Deportiva', 'cancha', "4");
#Inserción de accesorios
INSERT INTO Accesorios (Cant, Nom_acce, Marca) VALUES
(10, 'Cable internet', 'AmazonBasics'),
(15, 'Mouse', 'Logitech'),
(8, 'Teclado', 'Microsoft'),
(20, 'Monitor', 'Anker'),
(12, 'Cable HDMI', 'Sony');
#Inserción de tickets
INSERT INTO Tickets (Id_Equi, Fecha_Repor, Estado, Id_usu) VALUES
(201, '2025-05-20'),
(202, '2025-05-21'),
(203, '2025-05-22'),
(204, '2025-05-23');
#Inserción Roles
INSERT INTO Roles (Nom_rol) VALUES
("Instructor"),
("Administrador"),
("Tecnico");
#Inserción Espacio_publico
INSERT INTO Espacio_publico (Nom_Espa, Tiem_Uso, Hora_Soli, Num_Ficha) VALUES
('Auditorio Principal', '02:00:00', '09:00:00', 1001157),
('Cancha de Baloncesto', '01:30:00', '14:00:00', 1475002),
('Sala de Conferencias 1', '03:00:00', '10:30:00', 1003963),
('Salón de Usos Múltiples', '04:00:00', '08:00:00', 1022804);
#insercion categoria
INSERT INTO Categoria (Categoria) VALUES
('Portátiles'),
('Equipo de mesa'),
('Televisores');
#insertar solicitudes
CALL Solitudes (2,1,1);