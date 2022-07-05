CREATE DATABASE obligatorioAG2021
USE obligatorioAG2021
SET DATEFORMAT YMD;

drop table Pais
drop table Pasajero
drop table PasajeroTelefono
drop table Terminal
drop table bus
drop table Asiento
drop table viaje
drop table boleto
drop table PasajeroMercoSur
drop table PasajeroMercoSurBeneficio

CREATE TABLE Pais(
IdPais decimal not null Primary Key,
NombrePais varchar(50));

CREATE TABLE Pasajero (
IdPasajero decimal not null Primary Key,
NombrePasajero varchar(60),
APaternoPasajero varchar(60),
AMaternoPasajero varchar(60),
TipoDocumentoPasajero char(3),
NumeroDocumentoPasajero decimal,
FechaNacimientoPasajero date,
EmailPasajero varchar(60),
PasswordPasajero character(40),
IdPais decimal not null foreign key references Pais(IdPais));

CREATE TABLE PasajeroTelefono (
IdPasajero decimal not null foreign key references Pasajero (IdPasajero),
TelefonoPasajero varchar(60),
Primary Key (IdPasajero, TelefonoPasajero));

CREATE TABLE Terminal (
IdTerminal decimal not null Primary Key,
NombreTerminal varchar(60),
IdPais decimal not null foreign key references Pais(IdPais));

CREATE TABLE bus (
Idbus decimal not null Primary Key,
Tipobus varchar(60),
Capacidadbus integer,
Marcabus varchar(80));

CREATE TABLE Asiento (
Idbus decimal not null foreign key references bus (Idbus),
FilaAsiento integer,
LetraAsiento char(2),
Primary Key (Idbus,FilaAsiento,LetraAsiento));

CREATE TABLE Viaje (
IdTerminalOrigenViaje decimal not null foreign key references Terminal
(IdTerminal),
IdTerminalDestinoViaje decimal not null foreign key references Terminal
(IdTerminal),
FechaHoraViaje datetime,
Importe float,
Idbus decimal foreign key references bus (Idbus),
IdViaje decimal not null Primary Key);

CREATE TABLE Boleto (
IdPasajero decimal not null foreign key references Pasajero (IdPasajero),
Idbus decimal not null foreign key references bus (Idbus),
FilaAsiento integer,
LetraAsiento char(2),
FechaCompraBoleto date,
IdViaje decimal not null foreign key references Viaje (IdViaje),
Foreign key (Idbus,FilaAsiento,LetraAsiento) references
Asiento(Idbus,FilaAsiento,LetraAsiento));

CREATE TABLE PasajeroMercoSur (
IdPasajero decimal not null foreign key references Pasajero (IdPasajero),
PorcentajePasajeroMercoSur float,
Primary Key (IdPasajero));

CREATE TABLE PasajeroMercoSurBeneficio (
IdPasajero decimal not null foreign key references Pasajero (IdPasajero),
BeneficioMercoSur varchar(80),
Primary Key (IdPasajero,BeneficioMercoSur));

 -----------------------------------------------
 ---------------- INSERTS ----------------------
 -----------------------------------------------

 -- insert de Tabla Pais --

 insert into Pais(IdPais, NombrePais) values (1, 'Uruguay');
 insert into Pais(IdPais, NombrePais) values (2, 'Argentina');
 insert into Pais(IdPais, NombrePais) values (3, 'Brasil');
 insert into Pais(IdPais, NombrePais) values (4, 'Paraguay');
 insert into Pais(IdPais, NombrePais) values (10, 'Portugal');
 insert into Pais(IdPais, NombrePais) values (11, 'Francia');
 insert into Pais(IdPais, NombrePais) values (12, 'Espana');
 insert into Pais(IdPais, NombrePais) values (13, 'Alemania');

 -- insert de tabla Pasajero --

 insert into Pasajero(IdPasajero, NombrePasajero, APaternoPasajero, AMaternoPasajero, TipoDocumentoPasajero, NumeroDocumentoPasajero, FechaNacimientoPasajero, EmailPasajero, PasswordPasajero, IdPais)
 values (1, 'Juan', 'Perez', 'Gomez', 'CED', 123456, '2000-11-20', 'juan@gmail.com', 'pass111', 1);

 insert into Pasajero(IdPasajero, NombrePasajero, APaternoPasajero, AMaternoPasajero, TipoDocumentoPasajero, NumeroDocumentoPasajero, FechaNacimientoPasajero, EmailPasajero, PasswordPasajero, IdPais)
 values (2, 'Romina', 'Lopez', 'Rodriguez', 'CED', 654321, '2001-12-30', 'romina@gmail.com', 'pass222', 1);

 insert into Pasajero(IdPasajero, NombrePasajero, APaternoPasajero, AMaternoPasajero, TipoDocumentoPasajero, NumeroDocumentoPasajero, FechaNacimientoPasajero, EmailPasajero, PasswordPasajero, IdPais)
 values (3, 'Pablo', 'Contreras', 'Josto', 'PAS', 111222, '1998-10-20', 'pablo@gmail.com', 'pass333', 2);

 insert into Pasajero(IdPasajero, NombrePasajero, APaternoPasajero, AMaternoPasajero, TipoDocumentoPasajero, NumeroDocumentoPasajero, FechaNacimientoPasajero, EmailPasajero, PasswordPasajero, IdPais)
 values (4, 'Roberto', 'Lemos', 'Astoria', 'PAS', 222333, '2002-11-01', 'roberto@gmail.com', 'pass444', 3);

 insert into Pasajero(IdPasajero, NombrePasajero, APaternoPasajero, AMaternoPasajero, TipoDocumentoPasajero, NumeroDocumentoPasajero, FechaNacimientoPasajero, EmailPasajero, PasswordPasajero, IdPais)
 values (5, 'Soy', 'Turista', 'Pasajero', 'PAS', 333444, '2004-12-25', 'soyturista@gmail.com', 'pass555', 1);

 -- insert de tabla PasajeroTelefono --

 insert into PasajeroTelefono(IdPasajero,TelefonoPasajero)
 values (1, '099123456');

 insert into PasajeroTelefono(IdPasajero,TelefonoPasajero)
 values (2, '099123456');

 insert into PasajeroTelefono(IdPasajero,TelefonoPasajero)
 values (4, '099444111');

 insert into PasajeroTelefono(IdPasajero,TelefonoPasajero)
 values (4, '099444222');

 insert into PasajeroTelefono(IdPasajero,TelefonoPasajero)
 values (4, '099444333');

 -- Insert de Terminal --

 insert into Terminal(IdTerminal, NombreTerminal, IdPais)
 values (1, 'Terminal Tres Cruces', 1)

 insert into Terminal(IdTerminal, NombreTerminal, IdPais)
 values (2, 'Terminal Retiro', 2)

 insert into Terminal(IdTerminal, NombreTerminal, IdPais)
 values (3, 'Rio de Janeiro Terminal', 3)

 insert into Terminal(IdTerminal, NombreTerminal, IdPais)
 values (4, 'Terminal Asuncion', 4)

 -- insert de tabla bus --

 insert into bus(Idbus, Tipobus, Capacidadbus, Marcabus)
 values(1, 'Semi-Cama', 42, 'Volvo')
 insert into bus(Idbus, Tipobus, Capacidadbus, Marcabus)
 values(2, 'Cama Dos pisos', 62, 'Mercedes')
 insert into bus(Idbus, Tipobus, Capacidadbus, Marcabus)
 values(3, 'Comun', 32, 'Volskwagen')
 insert into bus(Idbus, Tipobus, Capacidadbus, Marcabus)
 values(4, 'Cama', 52, 'Chevrolet')

 -- insert de tabla Asiento --

 insert into Asiento(Idbus, FilaAsiento, LetraAsiento)
 values(1, 1, 'A')
  insert into Asiento(Idbus, FilaAsiento, LetraAsiento)
 values(1, 1, 'B')
  insert into Asiento(Idbus, FilaAsiento, LetraAsiento)
 values(1, 1, 'C')
  insert into Asiento(Idbus, FilaAsiento, LetraAsiento)
 values(1, 1, 'D')
   insert into Asiento(Idbus, FilaAsiento, LetraAsiento)
 values(1, 1, 'E')

  insert into Asiento(Idbus, FilaAsiento, LetraAsiento)
 values(2, 2, 'A')
  insert into Asiento(Idbus, FilaAsiento, LetraAsiento)
 values(2, 2, 'B')
  insert into Asiento(Idbus, FilaAsiento, LetraAsiento)
 values(2, 2, 'C')
  insert into Asiento(Idbus, FilaAsiento, LetraAsiento)
 values(2, 2, 'D')

  insert into Asiento(Idbus, FilaAsiento, LetraAsiento)
 values(3, 11, 'A')
  insert into Asiento(Idbus, FilaAsiento, LetraAsiento)
 values(3, 12, 'B') 
 insert into Asiento(Idbus, FilaAsiento, LetraAsiento)
 values(3, 22, 'D')
  insert into Asiento(Idbus, FilaAsiento, LetraAsiento)
 values(3, 32, 'A')

  insert into Asiento(Idbus, FilaAsiento, LetraAsiento)
 values(4, 23, 'D')
  insert into Asiento(Idbus, FilaAsiento, LetraAsiento)
 values(4, 25, 'C')
  insert into Asiento(Idbus, FilaAsiento, LetraAsiento)
 values(4, 22, 'A')
 insert into Asiento(Idbus, FilaAsiento, LetraAsiento)
 values(4, 4, 'D')

 -- insert de tabla Viaje --

 insert into Viaje(IdTerminalOrigenViaje, IdTerminalDestinoViaje, FechaHoraViaje, Importe, Idbus, IdViaje)
 values(1, 2, '2020/02/05', 150.0, 1, 1);

 insert into Viaje(IdTerminalOrigenViaje, IdTerminalDestinoViaje, FechaHoraViaje, Importe, Idbus, IdViaje)
 values(2, 3, '2020/01/05', 160.0, 2, 2);

 insert into Viaje(IdTerminalOrigenViaje, IdTerminalDestinoViaje, FechaHoraViaje, Importe, Idbus, IdViaje)
 values(3, 4, '2020/12/05', 170.0, 3, 3);

 insert into Viaje(IdTerminalOrigenViaje, IdTerminalDestinoViaje, FechaHoraViaje, Importe, Idbus, IdViaje)
 values(4, 1, '2020/11/05', 180.0, 4, 4);

 insert into Viaje(IdTerminalOrigenViaje, IdTerminalDestinoViaje, FechaHoraViaje, Importe, Idbus, IdViaje)
 values(4, 1, '2021/11/06', 190.0, 4, 5);

 insert into Viaje(IdTerminalOrigenViaje, IdTerminalDestinoViaje, FechaHoraViaje, Importe, Idbus, IdViaje)
 values(2, 4, '2021/11/07', 200.0, 3, 255);

 insert into Viaje(IdTerminalOrigenViaje, IdTerminalDestinoViaje, FechaHoraViaje, Importe, Idbus, IdViaje)
 values(3, 1, '2021/09/24', 210.0, 1, 256);

 -- insert de tabla Boleto --

 insert into Boleto(IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, IdViaje)
 values(1, 1, 1, 'B', '2020/12/20', 1);
 insert into Boleto(IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, IdViaje)
 values(3, 1, 1, 'A', '2020/12/21', 1);
 insert into Boleto(IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, IdViaje)
 values(4, 1, 1, 'D', '2020/12/22', 1);

 insert into Boleto(IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, IdViaje)
 values(2, 2, 2, 'B', '2020/12/23', 2);
 insert into Boleto(IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, IdViaje)
 values(4, 2, 2, 'C', '2020/12/24', 2);
 insert into Boleto(IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, IdViaje)
 values(1, 2, 2, 'A', '2020/12/25', 2);

 insert into Boleto(IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, IdViaje)
 values(2, 3, 11, 'A', '2020/12/26', 3);
 insert into Boleto(IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, IdViaje)
 values(2, 3, 12, 'B', '2020/12/27', 3);
 insert into Boleto(IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, IdViaje)
 values(4, 3, 22, 'D', '2020/12/28', 3);
 insert into Boleto(IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, IdViaje)
 values(5, 3, 32, 'A', '2021/09/03', 3);

 insert into Boleto(IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, IdViaje)
 values(1, 4, 23, 'D', '2020/12/29', 4);
 insert into Boleto(IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, IdViaje)
 values(1, 4, 25, 'C', '2020/12/30', 4);
 insert into Boleto(IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, IdViaje)
 values(3, 4, 22, 'A', '2020/12/31', 4);
 insert into Boleto(IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, IdViaje)
 values(2, 4, 4, 'D', '2021/11/06', 4);

 insert into Boleto(IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, IdViaje)
 values(5, 3, 32, 'A', '2021/03/07', 255);
 insert into Boleto(IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, IdViaje)
 values(5, 1, 1, 'D', '2021/09/11', 256);
  insert into Boleto(IdPasajero, Idbus, FilaAsiento, LetraAsiento, FechaCompraBoleto, IdViaje)
 values(5, 1, 1, 'E', '2021/09/11', 256);

 -- JUEGOS DE PRUEBA --
 Insert into Pais
values (1,'Uruguay'),(2,'Brasil'),(3,'Argentina'),(4,'Paraguay'),(5,'Espa�a'),(6,'Rusia'),(7,'Chile');

insert into Pasajero
values	(1,'Lionel','Messi','','AAA',1111,'1992-12-12','adrimede@hotmail.com','adr123',1),
		(2,'Neymar','Junior','','BBB',2222,'1990-12-24','brupic@hotmail.com','bru123',3),
		(3,'Paulo','Dybala','','CCC',3333,'1960-05-10','juanan@hotmail.com','jua123',2),
		(4,'Thiago','Silva','','DDD',4444,'1980-07-12','soyturista@gmail.com','seb123',2),
		(5,'Gonzalo','Higuain','','EEE',5555,'1995-10-28','fedemede@hotmail.com','fed123',1),
		(10,'Fernando','Muslera','','AAA',1111,'1992-12-12','fernandomuslera@hotmail.com','xxx',1),
		(11,'Diego','Godin','','BBB',2222,'1990-12-24','diegogodin@hotmail.com','yyy',1),
		(12,'Jos� Mar�a','Gimenez','','CCC',3333,'1960-05-10','josema@hotmail.com','zzz',1),
		(13,'Luis','Suarez','','DDD',4444,'1980-07-12','luchosuarez@gmail.com','ttt',1),
		(14,'Edinson','Cavani','','EEE',5555,'1995-10-28','edicavani@hotmail.com','www',1),
		(15,'Arturo','Vidal','','EEE',5555,'1995-10-28','artrito@hotmail.com','www',7);

insert into PasajeroTelefono
values(1,'095237627'),
	  (2,'095223234'),
	  (3,'092232327'),
	  (4,'094237627'),
	  (5,'092237627'),
	  (1,'097237237');

insert into Terminal
values(1,'Montevideo',1),
      (2,'San Pablo',2),
	  (3,'Buenos Aires',3),
	  (4,'Rio',2),
	  (5,'Asuncion',4),
	  (6,'Santiago de chile',7),
	  (7,'Moscu',6),
	  (8,'Leningrado',6);

insert into bus
values(1,'Internacional',40,'CUTCSA'),
      (2,'Urbano',32,'CUTCSA'),
      (3,'Internacional',40,'COME'),
	  (4,'Urbano',32,'COME');

insert into Asiento
values	(1,1,'A'),(1,2,'A'),(1,3,'A'),(1,4,'A'),
		(1,1,'B'),(1,2,'B'),(1,3,'B'),(1,4,'B'),
		(1,1,'C'),(1,2,'C'),(1,3,'C'),(1,4,'C'),
		(1,1,'D'),(1,2,'D'),(1,3,'D'),(1,4,'D'),
		(2,1,'A'),(2,2,'A'),(2,3,'A'),(2,4,'A'),
		(2,1,'B'),(2,2,'B'),(2,3,'B'),(2,4,'B'),
		(2,1,'C'),(2,2,'C'),(2,3,'C'),(2,4,'C'),
		(2,1,'D'),(2,2,'D'),(2,3,'D'),(2,4,'D'),
		(3,1,'A'),(3,2,'A'),(3,3,'A'),(3,4,'A'),
		(3,1,'B'),(3,2,'B'),(3,3,'B'),(3,4,'B'),
		(3,1,'C'),(3,2,'C'),(3,3,'C'),(3,4,'C'),
		(3,1,'D'),(3,2,'D'),(3,3,'D'),(3,4,'D'),
		(4,1,'A'),(4,2,'A'),(4,3,'A'),(4,4,'A'),
		(4,1,'B'),(4,2,'B'),(4,3,'B'),(4,4,'B'),
		(4,1,'C'),(4,2,'C'),(4,3,'C'),(4,4,'C'),
		(4,1,'D'),(4,2,'D'),(4,3,'D'),(4,4,'D');


insert into Viaje(IdTerminalOrigenViaje,IdTerminalDestinoViaje,FechaHoraViaje,Importe,Idbus,IdViaje)
values	(1,2,'2018-06-01 12:30:40',150,1,1),   -- Montevideo San Pablo
		(1,2,'2017-05-12 12:30:40',150,1,2),   -- Montevideo San Pablo
		(5,1,'2017-07-17 15:40:10',120,2,3),   -- Asuncion Montevideo 
		(2,3,'2017-08-28 19:00:15',100,3,4),   -- San Pablo Buenos Aires
		(4,8,'2017-09-04 21:45:55',150,4,5),   -- Rio Moscu 
		(1,2,'2017-11-16 00:00:00',150,3,6),   -- Montevideo San Pablo modificar esta fecha para el bus que sale ma�ana
		(5,1,'2017-11-15 12:40:00',150,3,7),   -- viaje del boleto del mes 9 
		(1,4,'2017-12-21 05:10:00',250,1,8),   -- viaje del boleto del mes 9
		(5,2,'2017-10-02 21:20:00',120,3,9),   -- viaje del boleto del mes 9 
		(1,3,'2017-11-20 00:00:00',150,3,255), -- Montevideo Buenos Aires
	    (5,3,'2017-12-13 00:00:00',130,4,256), -- Asuncion Buenos Aires
		(1,8,'2018-06-01 12:30:40',150,1,100), -- montevideo moscu
		(1,6,'2018-06-01 12:30:40',150,1,101); -- montevideo santiago


insert into Boleto
values	(1,1,1,'A','2017-01-01',1),	   		
		(1,1,1,'B','2017-01-01',1),
		(1,1,1,'C','2017-01-01',1),
		(1,1,1,'D','2017-01-01',1),
		(2,1,2,'A','2017-02-05',2),
		(4,3,2,'A','2017-09-15',7),--boleto del mes 9 del mail soyturista@gmail.com
		(4,1,4,'C','2017-09-22',8),--boleto del mes 9 del mail soyturista@gmail.com
		(4,3,3,'A','2017-09-05',9),--boleto del mes 9 del mail soyturista@gmail.com
		(4,3,2,'A','2017-09-05',9),--boleto del mes 9 del mail soyturista@gmail.com
		(2,1,2,'B','2017-02-05',2),
		(3,2,2,'A','2017-03-17',3),
		(4,3,1,'B','2017-05-15',4),
		(5,4,3,'C','2017-07-25',5),
		(2,1,3,'A','2017-02-05',2),
		(2,1,3,'B','2017-02-05',2),
		(2,1,1,'A','2017-02-05',2),
		(2,1,1,'B','2017-02-05',2),
		(4,3,4,'B','2017-01-09',255),
		(10,1,1,'A','2017-01-01',100),	   		
		(11,1,1,'B','2017-01-01',100),
		(12,1,1,'C','2017-01-01',100),
		(13,1,1,'D','2017-01-01',100),
		(14,1,2,'A','2017-02-05',100),
		(15,1,2,'A','2017-02-05',101);


insert into boleto values
        (4,3,2,'A','2021-09-15',7),--boleto del mes 9 del mail soyturista@gmail.com
		(4,1,4,'C','2021-09-22',8),--boleto del mes 9 del mail soyturista@gmail.com
		(4,3,3,'A','2021-09-05',9),--boleto del mes 9 del mail soyturista@gmail.com
		(4,3,2,'A','2021-09-05',9);--boleto del mes 9 del mail soyturista@gmail.com


insert into PasajeroMercoSur
values	(1,5),(2,5),(5,10);


insert into PasajeroMercoSurBeneficio
values	(1,'Beneficio por ser pasajero mercosur'),
		(2,'Beneficio por ser pasajero mercosur'),
		(5,'Beneficio por ser pasajero mercosur');


 ---------------------------------------------------------------------
 --------------------------- CONSULTAS -------------------------------
 ---------------------------------------------------------------------

-- 1 Listar el o los nombres de los pasajeros con la mayor cantidad de pasajes comprados a su nombre. --

-- Muestra los pasajeros cuyo count sea igual al max de pasajes comprados
SELECT p.NombrePasajero, count(b.idpasajero) Cantidad_Pasajes
FROM boleto b join pasajero p on p.idpasajero = b.idpasajero 
GROUP BY b.idpasajero, p.NombrePasajero
HAVING count(b.idpasajero) = ( 
	-- Busca el pasajero con la mayor cantidad de pasajes comprados
	SELECT max(listaCant.cantPasajes) 
	FROM ( 
		-- Contamos cuantos boletos compro cada pasajero
		SELECT idpasajero, count(idpasajero) cantPasajes 
		FROM boleto 
		GROUP BY idpasajero) listaCant
	);

-- 2 Listar todos los datos de los buses con más de 35 asientos que no tengan asignado ningún destino que parta el día de mañana. --

SELECT DISTINCT b.Idbus, b.Tipobus, b.Capacidadbus, b.Marcabus FROM bus b join viaje v ON b.idbus = v.idbus
WHERE b.Capacidadbus > 35 and v.FechaHoraViaje != dateadd(day, 1, cast(getdate() as Date)) -- Casteamos a Date para quitar las horas de la comparacion

-- 3 Listar todos los datos de los pasajeros para los cuales haya registrados en el sistema más de 5 pasajes comprados.

SELECT p.IdPasajero, p.NombrePasajero, p.APaternoPasajero, p.AMaternoPasajero, p.TipoDocumentoPasajero, p.NumeroDocumentoPasajero, p.FechaNacimientoPasajero, p.EmailPasajero, p.PasswordPasajero, p.IdPais 
FROM (pasajero p join boleto b on p.idpasajero = b.idpasajero) 
GROUP BY p.IdPasajero, p.NombrePasajero, p.APaternoPasajero, p.AMaternoPasajero, p.TipoDocumentoPasajero, p.NumeroDocumentoPasajero, p.FechaNacimientoPasajero, p.EmailPasajero, p.PasswordPasajero, p.IdPais 
HAVING count(*) > 5
-- Probar con 3 ya que no tenemos precargas con mas de 5 pasajes comprados

-- 4  Listar idpasajero, nombre, apellidos y asiento (idasiento y fila) que correspondan a pasajes comprados para el destino cuyo idviaje es 255. --

SELECT p.idpasajero, p.NombrePasajero, p.APaternoPasajero, p.AMaternoPasajero, b.FilaAsiento, b.LetraAsiento 
FROM pasajero p join boleto b ON p.idpasajero = b.idpasajero
WHERE b.idviaje = 255;

-- 5 Listar todos los iddestino y cantidad de pasajes comprados durante el mes de Setiembre de este año para c/u de los destinos del pasajero cuyo correo es soyturista@gmail.com. --
-- La lista debe estar ordenada por iddestino ascendente. --
-- arreglar!! --

SELECT v.IdViaje, count(*) pasajes_comprados 
FROM (Viaje v join boleto b ON v.IdViaje = b.IdViaje join Pasajero p ON p.IdPasajero = b.IdPasajero) 
GROUP BY v.IdViaje, b.FechaCompraBoleto, p.EmailPasajero
HAVING b.FechaCompraBoleto >= cast(cast(year(getdate()) as varchar(4)) + '/09/01' as Datetime) 
		and b.FechaCompraBoleto <= cast(cast(year(getdate()) as varchar(4)) + '/09/30' as Datetime) 
		and p.EmailPasajero = 'soyturista@gmail.com'
ORDER BY v.IdViaje ASC;