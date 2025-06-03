# Inserción tipos de documento
INSERT INTO Tip_document (Tipo_Doc) VALUES
('Cédula de Ciudadanía'),
('Pasaporte'),
('Cédula de Extranjería');
# Inserción de Usuarios
CALL Usuarios ("Anderson", "Capera", "joelcapera@gmail.com","1034596125", "holaaa", "activo","2");
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
CALL Solicitudes (2,1,1);
SELECT * FROM Solicitudes;
#Insertar elemento
CALL Elemento ("Teclado", "Todas las teclas funcionan bien", "178935748921","1","2");
SELECT * FROM Elemento;



