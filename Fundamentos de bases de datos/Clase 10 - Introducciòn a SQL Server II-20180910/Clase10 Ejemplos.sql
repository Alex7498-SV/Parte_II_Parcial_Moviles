CREATE TABLE ALUMNO(
	idAlumno INT PRIMARY KEY,
	nombre VARCHAR(15),
	apellido VARCHAR(15)
);

CREATE TABLE ALUMNOXCURSO(
	idAlumno INT NOT NULL,
	idCurso INT NOT NULL
);

CREATE TABLE CURSO(
	idCurso INT PRIMARY KEY,
	nombre VARCHAR(30),
	uv INT
);

ALTER TABLE ALUMNOXCURSO ADD PRIMARY KEY(idAlumno, idCurso);
ALTER TABLE ALUMNOXCURSO ADD FOREIGN KEY (idAlumno) REFERENCES ALUMNO (idAlumno);
ALTER TABLE ALUMNOXCURSO ADD FOREIGN KEY (idCurso) REFERENCES CURSO (idCurso);

SELECT * FROM ALUMNO;

--INSERTANDO DATOS EN TABLA:
-- INSERT INTO <tabla> (columnaA, columnaB, ...) VALUES (valorA, valorB,....);
--datos alumnos
INSERT INTO alumno (idAlumno, nombre, apellido)
	VALUES (1, 'Rafael', 'Cruz');
INSERT INTO alumno (idAlumno, nombre, apellido)
	VALUES (2, 'Gabriela', 'Salguero');


INSERT INTO alumno (idAlumno, nombre)
	VALUES (3, 'Daniel');
INSERT INTO alumno (idAlumno, nombre, apellido)
	VALUES (4, '', 'rrrr');
INSERT INTO alumno  VALUES (5,'Karicha', 'Lobato');

SELECT * FROM alumno;

--ELIMINANDO REGISTROS
--DELETE FROM <tabla>;
DELETE FROM alumno; --ERROR!!! elimina todos los registros de la tabla

DELETE FROM alumno WHERE idAlumno = 4;

--utilizando condiciones para mostrar datos.
SELECT * FROM alumno
	WHERE idAlumno > 4;
SELECT * FROM alumno
	WHERE idAlumno >= 2;
SELECT * FROM alumno
	WHERE idAlumno >= 2 AND idAlumno <= 4;
SELECT * FROM alumno 
	WHERE nombre = 0;


SELECT * FROM alumno;
--ACTUALIZANDO REGISTROS
--UPDATE <table> SET columnaA = valorA, columnaB = valorB... WHERE <condicion>
--sin condicion....
UPDATE alumno SET apellido = 'Orozco'
--eliminando
DELETE FROM alumno;
--realizando update del registro 4
UPDATE alumno SET apellido = 'Orozco' WHERE idAlumno = 3;



--INSERTANDO DATOS EN LA TABLA CURSO
INSERT INTO curso VALUES(1, 'Programacion I', 4);
INSERT INTO curso VALUES(2,'Matematica I', 5);
INSERT INTO curso VALUES(3,'Sociologia', 3);
SELECT * FROM curso;

--INSERTANDO EN TABLA CRUZ
INSERT INTO ALUMNOXCURSO VALUES (1,1);
INSERT INTO alumnoxcurso VALUES (1,2);
INSERT INTO alumnoxcurso VALUES (2,1);
INSERT INTO alumnoxcurso VALUES (2,2);
INSERT INTO alumnoxcurso VALUES (2,3);
INSERT INTO alumnoxcurso VALUES (3,3);
INSERT INTO alumnoxcurso VALUES (3,3);

SELECT * FROM alumno;
SELECT * FROM alumnoxcurso;
SELECT * FROM curso;


--JOINS usando la clausula WHERE
SELECT alumno.idAlumno, alumno.nombre, alumno.apellido, alumnoxcurso.idAlumno, alumnoxcurso.idCurso, curso.idCurso, curso.nombre, curso.uv
FROM alumno, alumnoxcurso, curso
WHERE alumno.idAlumno = alumnoxcurso.idAlumno AND alumnoxcurso.idCurso = curso.idCurso;

SELECT alumno.idAlumno, alumno.nombre, alumno.apellido, curso.idCurso, curso.nombre, curso.uv
FROM alumno, alumnoxcurso, curso
WHERE alumno.idAlumno = alumnoxcurso.idAlumno 
	AND alumnoxcurso.idCurso = curso.idCurso;