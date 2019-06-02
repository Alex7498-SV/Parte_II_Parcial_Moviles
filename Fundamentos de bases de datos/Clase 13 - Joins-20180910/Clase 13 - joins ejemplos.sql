CREATE TABLE EMPRESA(
	idEmpresa INT PRIMARY KEY IDENTITY,
	nombre VARCHAR(20)
);

CREATE TABLE TELEFONO(
	idTelefono INT PRIMARY KEY IDENTITY,
	nombre VARCHAR(20),
	idEmpresa INT,
	precio DECIMAL(5,2)
);

ALTER TABLE TELEFONO ADD FOREIGN KEY (idEmpresa) REFERENCES EMPRESA (idEmpresa);

INSERT INTO EMPRESA (nombre) VALUES ('Alcatel');
INSERT INTO EMPRESA (nombre) VALUES ('Huawei');
INSERT INTO EMPRESA (nombre) VALUES ('LG');
INSERT INTO EMPRESA (nombre) VALUES ('Samsung');
INSERT INTO EMPRESA (nombre) VALUES ('Apple');
INSERT INTO EMPRESA (nombre) VALUES ('Xiaomi')
SELECT * FROM EMPRESA;

INSERT INTO TELEFONO VALUES('iPhone 7',5,790.00);
INSERT INTO TELEFONO VALUES('iPhone 6',5,549.00);
INSERT INTO TELEFONO VALUES('P9 Lite',2,222.13);
INSERT INTO TELEFONO VALUES('Honor 5x',2,165.98);
INSERT INTO TELEFONO VALUES('S7 edge',4,629.99);
INSERT INTO TELEFONO VALUES('S6 edge',4,346.42);
INSERT INTO TELEFONO VALUES('mate 8',2,495.99);
INSERT INTO TELEFONO VALUES('one M8',NULL,162.57);
INSERT INTO TELEFONO VALUES('one M9',NULL,237.58);
SELECT * FROM TELEFONO;


------------------------------------------------
-------------------- JOINS ---------------------
------------------------------------------------
SELECT t.idTelefono, t.nombre, t.precio, m.nombre
FROM TELEFONO t INNER JOIN EMPRESA m
ON t.idEmpresa = m.idEmpresa;

SELECT t.idTelefono, t.nombre, t.precio, m.nombre
FROM TELEFONO t, EMPRESA m
WHERE t.idEmpresa = m.idEmpresa;

SELECT t.idTelefono, t.nombre, t.precio, m.nombre
FROM TELEFONO t LEFT JOIN EMPRESA m
ON t.idEmpresa = m.idEmpresa;

SELECT t.idTelefono, t.nombre, t.precio, m.nombre
FROM TELEFONO t RIGHT JOIN EMPRESA m
ON t.idEmpresa = m.idEmpresa;

SELECT t.idTelefono, t.nombre, t.precio, m.nombre
FROM TELEFONO t FULL JOIN EMPRESA m
ON t.idEmpresa = m.idEmpresa;

SELECT t.idTelefono, t.nombre, t.precio, m.nombre
FROM TELEFONO t FULL JOIN EMPRESA m
ON t.idEmpresa = m.idEmpresa;

SELECT t.idTelefono, t.nombre, t.precio, m.idEmpresa, m.nombre
FROM TELEFONO t FULL JOIN EMPRESA m
ON t.idEmpresa = m.idEmpresa
WHERE t.idTelefono IS NULL OR m.idEmpresa IS NULL;

SELECT t.idTelefono, t.nombre, t.precio, m.idEmpresa, m.nombre
FROM TELEFONO t FULL JOIN EMPRESA m
ON t.idEmpresa = m.idEmpresa
WHERE m.idEmpresa IS NULL;


------------------------------------------------
------------ Uniendo varias tablas -------------
------------------------------------------------

CREATE TABLE SEDE(
	idSede INT PRIMARY KEY IDENTITY,
	lugar VARCHAR(50),
	idEmpresa INT,
	CONSTRAINT fk_from_empresa FOREIGN KEY(idEmpresa) REFERENCES empresa(idEmpresa)
);

SELECT * FROM sede;

INSERT INTO SEDE(lugar,idEmpresa) VALUES('Kharagpur',3);
INSERT INTO SEDE(lugar,idEmpresa) VALUES('Dumbarton',6);
INSERT INTO SEDE(lugar,idEmpresa) VALUES('Stornaway',5);
INSERT INTO SEDE(lugar,idEmpresa) VALUES('Outremont',6);
INSERT INTO SEDE(lugar,idEmpresa) VALUES('Plainevaux',1);
INSERT INTO SEDE(lugar,idEmpresa) VALUES('Taltal',2);
INSERT INTO SEDE(lugar,idEmpresa) VALUES('Uluberia',6);
INSERT INTO SEDE(lugar,idEmpresa) VALUES('Huntsville',3);
INSERT INTO SEDE(lugar,idEmpresa) VALUES('Timkur',5);
INSERT INTO SEDE(lugar,idEmpresa) VALUES('Birmingham',6);
INSERT INTO SEDE(lugar,idEmpresa) VALUES('Selkirk',4);
INSERT INTO SEDE(lugar,idEmpresa) VALUES('Lewiston',1);
INSERT INTO SEDE(lugar,idEmpresa) VALUES('Gent',1);
INSERT INTO SEDE(lugar,idEmpresa) VALUES('Romeral',3);

SELECT e.nombre, s.idSede, s.lugar, t.idTelefono, t.nombre, t.precio
FROM SEDE s INNER JOIN EMPRESA e
ON s.idEmpresa = e.idEmpresa
INNER JOIN telefono t
ON e.idEmpresa = t.idEmpresa
WHERE e.idEmpresa = 2;


------------------------------------------------
---------------- SELF JOIN ---------------------
------------------------------------------------
INSERT INTO EMPLEADOEMPRESA( nombre, edad, jefeInmediato)
	VALUES('Hale, Clio B.', 45, NULL);
INSERT INTO EMPLEADOEMPRESA( nombre, edad, jefeInmediato)
	VALUES('Roberson, Kennan F.', 53, NULL);
INSERT INTO EMPLEADOEMPRESA( nombre, edad, jefeInmediato)
	VALUES('Moody, Derek K.', 41, NULL);
INSERT INTO EMPLEADOEMPRESA([nombre],[edad],[jefeInmediato]) VALUES('Bartlett, Omar U.',29,1),('Mccoy, Yoko T.',39,2),('Gilliam, Lareina X.',36,1),('Mosley, Lois M.',45,1),('Cotton, Jeanette T.',36,3);
INSERT INTO EMPLEADOEMPRESA([nombre],[edad],[jefeInmediato]) VALUES('Bradshaw, Griffin S.',41,3),('Fuller, Camden X.',46,2),('Scott, Chase C.',45,2),('Berg, George I.',38,3),('Blevins, Darryl G.',42,1);
INSERT INTO EMPLEADOEMPRESA([nombre],[edad],[jefeInmediato]) VALUES('Velazquez, Lev O.',25,3),('Carver, Louis M.',41,1),('Shields, Brock S.',39,3),('Knight, Martena F.',37,2),('Leblanc, Montana D.',28,3);
SELECT * FROM EMPLEADOEMPRESA;

SELECT E1.idEmpleado, E1.nombre AS 'empleado', E2.nombre AS 'JEFE'
	FROM EMPLEADOEMPRESA E1
	INNER JOIN EMPLEADOEMPRESA E2
	ON E1.jefeInmediato = E2.idEmpleado;