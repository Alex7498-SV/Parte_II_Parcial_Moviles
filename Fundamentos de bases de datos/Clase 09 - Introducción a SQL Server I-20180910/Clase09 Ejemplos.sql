CREATE TABLE TORNEO(
	idTorneo INT,
	nombreTorneo VARCHAR(20),
	annio DATE
);

CREATE TABLE EQUIPO(
	idEquipo INT,
	nombre VARCHAR(50),
	annioFundacion DATE
);

CREATE TABLE TORNEOXEQUIPO(
	idEquipo INT,
	idTorneo INT
);

--hola soy un comentario :D
--visualizar las tablas creadas:
SELECT idTorneo,nombreTorneo, annio FROM torneo;
select iDTorneo, NOMBRETORNEO, ANNIO from TORNEO; --SQL ES lenguaje no sensible a mayusculas!!!
SELECT nombreTorneo, annio, idTorneo FROM torneo;
SELECT idTorneo, annio FROM torneo;
SELECT * FROM TORNEO;

--BORRANDO OBJETOS 
DROP TABLE TORNEO;
DROP TABLE EQUIPO;
DROP TABLE TORNEOXEQUIPO;

--RESTRICCIONES: 
--AGREGANDO LLAVES PRIMARIAS
--COLUMNAS NULL
--COLUMNAS NOT NULL
--COLUMNAS UNIQUE
--AGREGANDO LLAVES FORANEAS
CREATE TABLE TORNEO(
	idTorneo INT NOT NULL,
	nombreTorneo VARCHAR(20) NOT NULL,
	annio DATE NOT NULL
);
--definiendo llave primaria opciòn 1
ALTER TABLE torneo ADD PRIMARY KEY (idTorneo);


CREATE TABLE EQUIPO(
	idEquipo INT PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	annioFundacion DATE NULL
);

CREATE TABLE TORNEOXEQUIPO(
	idEquipo INT NOT NULL,
	idTorneo INT NOT NULL
);
--pk compuestas
ALTER TABLE TORNEOXEQUIPO ADD PRIMARY KEY(idEquipo, idTorneo);

--CREANDO RELACIONES:
ALTER TABLE torneoxequipo ADD FOREIGN KEY (idTorneo) REFERENCES torneo (idTorneo); 
ALTER TABLE torneoxequipo ADD FOREIGN KEY (idEquipo) REFERENCES equipo (idEquipo);