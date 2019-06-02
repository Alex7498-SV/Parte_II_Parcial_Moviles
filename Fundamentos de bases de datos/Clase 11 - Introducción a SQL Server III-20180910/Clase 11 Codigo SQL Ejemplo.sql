CREATE TABlE tabla1(
	idTabla INT PRIMARY KEY,
	dato INT
);

INSERT INTO tabla1 VALUES(1,1);
INSERT INTO tabla1 VALUES(2,2);
INSERT INTO tabla1 VALUES(3,3);
INSERT INTO tabla1 VALUES(4,4);


TRUNCATE TABLE tabla1;


SELECT * FROM tabla1;


--ATRIBUTO IDENTITY
CREATE TABLE tabla2(
	secuencia INT IDENTITY(500,-3),
	cadena VARCHAR(10)
);
DROP TABLE tabla2;
INSERT INTO tabla2 (secuencia, cadena) VALUES (1,'qwerr');
INSERT INTO tabla2 (cadena) VALUES ('qwerr');

SELECT * FROM tabla2;

--Atributo DEFAULT
CREATE TABLE libro(
	idLibro INT PRIMARY KEY IDENTITY,
	titulo VARCHAR(15),
	autor VARCHAR(20) DEFAULT 'Desconocido',
	editorial VARCHAR(20),
	cantidad TINYINT DEFAULT 0,
	precio FLOAT
);

INSERT INTO libro (titulo, editorial, precio)
	VALUES ('qwert','Editorial Morgue',24.95);
INSERT INTO libro (titulo, autor, editorial, precio)
	VALUES ('game of thrones','RR Martin','Editorial XYZ',29.95);
SELECT * FROM libro;

--eliminando datos de la tabla
DELETE FROM libro;

--
INSERT INTO libro (titulo, editorial, precio)
	VALUES ('El principito','Editorial eewe',13.00);

SELECT * FROM libro;

--eliminando datos con truncate
TRUNCATE TABLE libro;

INSERT INTO libro (titulo, editorial, precio)
	VALUES ('El principito','Editorial eewe',13.00);

SELECT * FROM libro; --TRUNCATE SI REINICIA LOS CAMPOS AUTOINREMENT!!!

--COLUMNAS CALCULADAS
INSERT INTO libro (titulo, editorial, precio)
	VALUES ('qwert','Editorial Morgue',24.95);
INSERT INTO libro (titulo, autor, editorial, precio)
	VALUES ('game of thrones','RR Martin','Editorial XYZ',29.95);
SELECT * FROM libro;

SELECT idLibro, titulo, autor, editorial, cantidad, precio AS precioReal, precio * 0.9 AS precioDescuento
FROM libro;

--ACTUALIZANDO TABLA CON VALORES DE DESCUENTO
ALTER TABLE libro ADD precioDescuento FLOAT;
SELECT * FROM libro;

UPDATE libro SET precioDescuento = precio * 0.90;
SELECT * FROM libro;

ALTER TABLE libro ADD ISBN VARCHAR(20) NOT NULL DEFAULT '';