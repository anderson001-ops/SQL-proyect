INSERT INTO Tip_document (Tipo_Doc) VALUES
('Cédula de Ciudadanía'),
('Pasaporte'),
('Cédula de Extranjería');
INSERT INTO Prestamos (Fecha_entre, Fecha_recep, Tipo_prest, Espa_public) VALUES
('2025-05-20 10:00:00', '2025-05-20 12:00:00', ' Cancha Deportivoa', 'cancha' ),
('2025-05-21 14:30:00', '2025-05-21 17:00:00', 'Auditorio', 'auditorio'),
('2025-05-22 09:00:00', '2025-05-22 11:00:00', 'Auditoio', 'auditorio'),
('2025-05-23 11:00:00', '2025-05-23 13:00:00', ' Cancha Deportiva', 'cancha');
INSERT INTO Accesorios (Acces, Cant, Nom_acce, Marca) VALUES
('Cable HDMI', 10, 'Cable internet', 'AmazonBasics'),
('Mouse Inalámbrico', 15, 'Mouse', 'Logitech'),
('Teclado USB', 8, 'Teclado', 'Microsoft'),
('Adaptador USB-C', 20, 'Monitor', 'Anker'),
('Auriculares', 12, 'Cable HDMI', 'Sony');
INSERT INTO Tickets (Id_Equi, Fecha_Repor) VALUES
(201, '2025-05-20'),
(202, '2025-05-21'),
(203, '2025-05-22'),
(204, '2025-05-23'),
(205, '2025-05-24');
INSERT INTO Roles (Nom_rol) VALUES
("Instructor"),
("Administrador"),
("Tecnico");
INSERT INTO Espacio_publico (Nom_Espa, Tiem_Uso, Hora_Soli, Num_Ficha) VALUES
('Auditorio Principal', '02:00:00', '09:00:00', 1001157),
('Cancha de Baloncesto', '01:30:00', '14:00:00', 1475002),
('Sala de Conferencias 1', '03:00:00', '10:30:00', 1003963),
('Salón de Usos Múltiples', '04:00:00', '08:00:00', 1022804);