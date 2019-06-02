CREATE TABLE CLIENTE(
	idCliente INT PRIMARY KEY IDENTITY,
	dui CHAR(10),
	correo VARCHAR(50),
	nombre VARCHAR(100)
);

CREATE TABLE VENDEDOR(
	codVendedor CHAR(4) PRIMARY KEY,
	correo VARCHAR(50),
	nombre VARCHAR(100),
	jefeInmediato CHAR(4)
);

CREATE TABLE VENTA(
	idVenta INT PRIMARY KEY IDENTITY,
	idCliente INT,
	duiCliente CHAR(10),
	codVendedor CHAR(4),
	fecha DATE,
	CONSTRAINT fk_from_vendedor FOREIGN KEY (codVendedor) 
		REFERENCES vendedor(codVendedor)
);

--Segunda forma para crear llaves foraneas:
ALTER TABLE venta ADD CONSTRAINT fk_from_cliente FOREIGN KEY (idCliente) REFERENCES cliente(idCliente);

--Agregando otras llaves foraneas
-- ALTER TABLE venta ADD CONSTRAINT fk_from_cliente_dui FOREIGN KEY (duiCliente) REFERENCES cliente(dui); --este falla
ALTER TABLE cliente ADD CONSTRAINT unique_dui UNIQUE (dui);
ALTER TABLE venta ADD CONSTRAINT fk_from_cliente_dui FOREIGN KEY (duiCliente) REFERENCES cliente(dui);

--auto referencia
ALTER TABLE vendedor ADD CONSTRAINT fk_vendedor_autoref FOREIGN KEY(jefeInmediato) REFERENCES vendedor(codVendedor);

--INSERTS 
INSERT INTO cliente (dui, correo, nombre)
	VALUES('11111111-1','josemarti1@gmail.com','Jose Marti');
INSERT INTO cliente (dui, correo, nombre)
	VALUES('22222222-2','kstrada@gmail.com','Karla Estrada');


INSERT INTO vendedor (codVendedor, correo, nombre, jefeInmediato)
	VALUES('rv01','rvelado@emp.com','Rafael Velado',null);
--INSERT INTO vendedor (codVendedor, correo, nombre, jefeInmediato)
	--VALUES('cz01','czetino@emp.com','Carlos Zetino','rv02'); --este falla!!
INSERT INTO vendedor (codVendedor, correo, nombre, jefeInmediato)
	VALUES('cz01','czetino@emp.com','Carlos Zetino','rv01');
INSERT INTO vendedor (codVendedor, correo, nombre, jefeInmediato)
	VALUES('km01','kmira@emp.com','Katherine Mira','rv01');
INSERT INTO vendedor (codVendedor, correo, nombre, jefeInmediato)
	VALUES('mv01','mvargars@emp.com','Mario Vargas','rv01');
SELECT * FROM vendedor;


--TABLA VENTA
INSERT INTO venta (idCliente, duiCliente,codVendedor, fecha)
	VALUES(1,'11111111-1',null, '2017-12-13'); --esto no evita que el codvendedor quede null 
SELECT * FROM venta;
TRUNCATE TABLE venta;
ALTER TABLE venta ALTER COLUMN codVendedor CHAR(4) NOT NULL;
INSERT INTO venta (idCliente, duiCliente,codVendedor, fecha)
	VALUES(1,'11111111-1',null, '2017-12-13'); --ERROR
INSERT INTO venta (idCliente, duiCliente,codVendedor, fecha)
	VALUES(1,'11111111-1','km01', '2017-12-13'); 
INSERT INTO venta (idCliente, duiCliente,codVendedor, fecha)
	VALUES(1,'11111111-1','cz01', '2018-01-23');
INSERT INTO venta (idCliente, duiCliente,codVendedor, fecha)
	VALUES(1,'22222222-2','km01', '2018-01-27');
SELECT * FROM venta;

--Eliminando vendedores
SELECT * FROM venta;
DELETE FROM vendedor WHERE codVendedor = 'mv01'; 
DELETE FROM vendedor WHERE codVendedor = 'cz01'; --error
ALTER TABLE venta DROP CONSTRAINT fk_from_vendedor;
ALTER TABLE venta ADD CONSTRAINT fk_from_vendedor FOREIGN KEY (codVendedor) REFERENCES vendedor(codVendedor) ON DELETE CASCADE;
DELETE FROM vendedor WHERE codVendedor = 'cz01';
SELECT * FROM venta;