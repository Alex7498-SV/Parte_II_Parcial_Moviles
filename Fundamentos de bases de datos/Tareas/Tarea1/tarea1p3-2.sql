--BASE EJERCICIO 14
CREATE TABLE NOTA(
	carnet CHAR(8) PRIMARY KEY,
	parcial1 FLOAT,
	parcial2 FLOAT,
	parcial3 FLOAT,
	laboratorios FLOAT,
	proyecto FLOAT
);

INSERT INTO NOTA([carnet],[parcial1],[parcial2],[parcial3],[laboratorios],[proyecto]) VALUES('0004715',9,8,2,9,8);
INSERT INTO NOTA([carnet],[parcial1],[parcial2],[parcial3],[laboratorios],[proyecto]) VALUES('0008815',3,7,10,10,6);
INSERT INTO NOTA([carnet],[parcial1],[parcial2],[parcial3],[laboratorios],[proyecto]) VALUES('0009415',4,9,5,9,9);
INSERT INTO NOTA([carnet],[parcial1],[parcial2],[parcial3],[laboratorios],[proyecto]) VALUES('0008415',4,6,9,9,6);
INSERT INTO NOTA([carnet],[parcial1],[parcial2],[parcial3],[laboratorios],[proyecto]) VALUES('0009315',9,3,10,5,8);
INSERT INTO NOTA([carnet],[parcial1],[parcial2],[parcial3],[laboratorios],[proyecto]) VALUES('0005215',6,5,5,6,8);
INSERT INTO NOTA([carnet],[parcial1],[parcial2],[parcial3],[laboratorios],[proyecto]) VALUES('0005615',7,2,2,10,9);
INSERT INTO NOTA([carnet],[parcial1],[parcial2],[parcial3],[laboratorios],[proyecto]) VALUES('0001515',9,2,7,6,8);
INSERT INTO NOTA([carnet],[parcial1],[parcial2],[parcial3],[laboratorios],[proyecto]) VALUES('0006715',6,5,5,10,8);
INSERT INTO NOTA([carnet],[parcial1],[parcial2],[parcial3],[laboratorios],[proyecto]) VALUES('0008015',3,9,6,10,10);

select * from NOTA


--BASE EJERCICIO 15
CREATE TABLE CONTROLES(
	idControl INT PRIMARY KEY IDENTITY,
	estado BIT
);
INSERT INTO CONTROLES VALUES(0);
INSERT INTO CONTROLES VALUES(1);
INSERT INTO CONTROLES VALUES(1);
INSERT INTO CONTROLES VALUES(1);
INSERT INTO CONTROLES VALUES(0);
INSERT INTO CONTROLES VALUES(1);
INSERT INTO CONTROLES VALUES(0);
INSERT INTO CONTROLES VALUES(0);
SELECT * FROM CONTROLES