CREATE TABLE departamento(
	idDepto INT PRIMARY KEY IDENTITY,
	nombreDepto varchar(50)
);
INSERT INTO departamento (nombreDepto) VALUES('ventas'),('recursos humanos'),('administracion');

CREATE TABLE producto(
	idProducto INT PRIMARY KEY IDENTITY,
	nombreProducto VARCHAR(50),
	descripcion VARCHAR(50),
	precioUnidad FLOAT
);
INSERT INTO producto(nombreProducto,descripcion,precioUnidad) VALUES('imperdiet','Integer mollis.',38.20),('vel, venenatis','enim, condimentum eget,',31.31),('ipsum non','tellus. Nunc lectus',85.20),('magna nec','ultrices',0.51),('elit pede,','ut aliquam',25.03),('elit','pretium',64.57),('elit,','metus. Aliquam',17.00),('malesuada','lorem, sit',12.30),('Fusce','neque. In ornare',28.16),('risus quis','placerat eget, venenatis',66.91);
INSERT INTO producto(nombreProducto,descripcion,precioUnidad) VALUES('nulla','nonummy ac,',76.48),('dictum','sapien.',1.51),('molestie.','Maecenas',15.28),('mus.','Phasellus at',77.98),('Proin sed','aliquet',84.76),('non, dapibus','eros',20.81),('pede','adipiscing. Mauris molestie',63.10),('ipsum.','elit. Aliquam',70.70),('ante. Maecenas','orci',66.04),('et, lacinia','Vestibulum',29.58);
INSERT INTO producto(nombreProducto,descripcion,precioUnidad) VALUES('sagittis felis.','nulla. Integer urna.',83.95),('Maecenas','quis lectus. Nullam',93.20),('cursus, diam','elit elit',36.55),('enim. Etiam','scelerisque mollis.',38.12),('faucibus. Morbi','justo',9.42),('non sapien','odio. Phasellus',24.71),('bibendum.','nunc',11.66),('vel','metus.',89.58),('vulputate,','egestas',19.78),('erat','porttitor vulputate, posuere',0.76);

CREATE TABLE cliente(
	idCliente INT PRIMARY KEY IDENTITY,
	nombreCliente VARCHAR(50),
	ciudad VARCHAR(50)
);
SELECT * FROM CLIENTE;
INSERT INTO cliente(nombreCliente,ciudad) VALUES('Iris','Sobral'),('Sacha','Bolzano Vicentino'),('Lionel','Wakefield'),('Abraham','Aiseau-Presles'),('Kirk','Ferrere');
INSERT INTO cliente(nombreCliente,ciudad) VALUES('Xena','Ajmer'),('Chiquita','Paularo'),('Magee','Falkirk'),('Jaime','Attert'),('Lionel','Habay-la-Neuve');

CREATE TABLE empleado(
	idEmpleado INT PRIMARY KEY IDENTITY,
	nombreEmpleado VARCHAR(50),
	salario float,
	idDepto INT
);
ALTER TABLE empleado ADD FOREIGN KEY(idDepto) REFERENCES departamento(idDepto);
INSERT INTO empleado(nombreEmpleado,salario,idDepto) VALUES('Ferdinand',300.08,2),('Giselle',298.38,2),('Olivia',304.77,1),('Stuart',426.40,1),('Colby',329.26,3);
INSERT INTO empleado(nombreEmpleado,salario,idDepto) VALUES('Keane',362.62,2),('Dahlia',223.65,2),('Thor',352.09,3),('Zena',324.53,3),('Magee',253.25,3);
INSERT INTO empleado(nombreEmpleado,salario,idDepto) VALUES('Leo',457.32,3),('Sophia',460.09,3),('Ava',400.98,3),('September',250.86,3),('Aquila',334.45,1);

CREATE TABLE factura(
	idFactura INT PRIMARY KEY IDENTITY,
	idEmpleado INT,
	idCliente INT
);

ALTER TABLE factura ADD FOREIGN KEY(idEmpleado) REFERENCES empleado(idEmpleado);
ALTER TABLE factura ADD FOREIGN KEY(idCliente) REFERENCES cliente(idCliente);

INSERT INTO factura(idEmpleado,idCliente) VALUES(6,3),(12,4),(1,2),(3,4),(11,3),(9,6),(7,4),(3,3),(8,10),(7,6);
INSERT INTO factura(idEmpleado,idCliente) VALUES(5,9),(11,1),(14,4),(8,10),(11,9),(2,5),(8,1),(13,4),(8,3),(7,5);
INSERT INTO factura(idEmpleado,idCliente) VALUES(11,3),(12,2),(6,3),(12,8),(8,4),(1,8),(15,3),(2,7),(4,2),(1,9);
INSERT INTO factura(idEmpleado,idCliente) VALUES(9,8),(10,10),(5,3),(11,7),(5,4),(8,3),(9,2),(15,7),(3,8),(7,3);
INSERT INTO factura(idEmpleado,idCliente) VALUES(2,7),(12,7),(5,3),(5,2),(15,9),(1,5),(12,3),(14,6),(9,9),(1,2);
INSERT INTO factura(idEmpleado,idCliente) VALUES(10,4),(5,9),(2,4),(14,2),(14,5),(12,4),(14,7),(6,2),(8,5),(15,8);
INSERT INTO factura(idEmpleado,idCliente) VALUES(14,8),(14,9),(12,7),(11,5),(15,8),(1,9),(8,9),(2,1),(5,8),(3,8);
INSERT INTO factura(idEmpleado,idCliente) VALUES(8,1),(15,1),(14,3),(14,7),(7,5),(11,10),(1,8),(4,1),(3,9),(13,7);
INSERT INTO factura(idEmpleado,idCliente) VALUES(5,4),(12,8),(3,6),(7,7),(4,10),(15,3),(8,8),(8,6),(2,4),(8,9);
INSERT INTO factura(idEmpleado,idCliente) VALUES(5,7),(9,4),(10,3),(1,10),(11,9),(11,5),(14,10),(9,7),(2,4),(15,4);

CREATE TABLE ventaFactura(
	idFactura INT NOT NULL,
	idProducto INT NOT NULL,
	cantidad INT
);

ALTER TABLE ventaFactura ADD PRIMARY KEY(idFactura, idProducto);
ALTER TABLE ventaFactura ADD FOREIGN KEY(idProducto) REFERENCES producto(idProducto);
ALTER TABLE ventaFactura ADD FOREIGN KEY(idFactura) REFERENCES factura(idFactura);

INSERT INTO ventaFactura(idFactura,idProducto,cantidad) VALUES(2,12,2),(37,2,2),(45,9,8),(84,1,8),(68,20,9),(42,24,4),(74,17,8),(3,18,5),(20,20,1),(21,21,10);
INSERT INTO ventaFactura(idFactura,idProducto,cantidad) VALUES(56,8,9),(64,27,9),(72,15,8),(11,11,3),(75,4,8),(83,10,3),(14,8,9),(42,12,7),(38,14,8),(84,18,2);
INSERT INTO ventaFactura(idFactura,idProducto,cantidad) VALUES(91,2,1),(56,7,7),(13,14,3),(33,11,9),(67,9,6),(66,28,4),(26,18,1),(97,25,3),(74,11,9),(17,16,2);
INSERT INTO ventaFactura(idFactura,idProducto,cantidad) VALUES(88,4,1),(25,25,1),(54,14,10),(46,4,3),(65,7,4),(33,13,5),(98,8,5),(73,13,5),(1,22,9),(71,8,8);
INSERT INTO ventaFactura(idFactura,idProducto,cantidad) VALUES(23,30,3),(98,18,7),(34,3,3),(7,21,10),(96,25,7),(65,1,4),(49,15,4),(25,27,8),(49,22,7),(44,20,4);
INSERT INTO ventaFactura(idFactura,idProducto,cantidad) VALUES(67,12,4),(98,28,8),(64,28,8),(56,6,5),(77,5,5),(100,26,1),(92,27,3),(84,20,3),(28,21,7),(87,10,10);
INSERT INTO ventaFactura(idFactura,idProducto,cantidad) VALUES(76,30,10),(71,19,4),(17,7,4),(100,18,4),(2,15,6),(88,12,5),(80,20,2),(11,8,3),(28,13,2),(82,7,1);
INSERT INTO ventaFactura(idFactura,idProducto,cantidad) VALUES(96,16,2),(24,11,10),(55,23,7),(61,20,3),(51,2,5),(21,19,9),(26,22,8),(6,29,10),(95,16,7),(74,21,6);
INSERT INTO ventaFactura(idFactura,idProducto,cantidad) VALUES(56,19,1),(45,26,7),(22,18,9),(6,18,7),(72,13,1),(75,14,5),(60,15,3),(78,24,5),(14,23,1),(35,22,2);
INSERT INTO ventaFactura(idFactura,idProducto,cantidad) VALUES(52,3,3),(72,26,6),(95,10,6),(92,22,1),(87,2,1),(79,15,4),(22,20,1),(62,15,8),(100,4,6),(84,25,4);

----------------------------------------------------------------
--CLASE 15
----------------------------------------------------------------
--funciones de agrupacion
SELECT * FROM producto;
SELECT MAX(precioUnidad) FROM producto;
SELECT * FROM producto ORDER BY precioUnidad DESC;
SELECT MIN(precioUnidad) as resultado FROM producto;
SELECT SUM(precioUnidad) FROM producto;
SELECT AVG(precioUnidad) FROM producto;

--mostrar las ventas ha realizado cada empleado
SELECT emp.nombreEmpleado, fact.idFactura
FROM empleado emp, factura fact
WHERE emp.idEmpleado = fact.idEmpleado
ORDER BY emp.nombreEmpleado ASC;

SELECT emp.nombreEmpleado, fact.idFactura
FROM empleado emp
INNER JOIN factura fact
ON emp.idEmpleado = fact.idEmpleado
ORDER BY emp.nombreEmpleado ASC;

--mostrar cuantas ventas ha realizado cada empleado
SELECT emp.nombreEmpleado, count(fact.idFactura) numeroDeVentas
FROM empleado emp, factura fact
WHERE emp.idEmpleado = fact.idEmpleado
ORDER BY emp.nombreEmpleado ASC;

SELECT emp.nombreEmpleado, count(fact.idFactura) cantidadVendida
FROM empleado emp, factura fact
WHERE emp.idEmpleado = fact.idEmpleado
GROUP BY emp.nombreEmpleado
ORDER BY emp.nombreEmpleado ASC;

--MOSTRAR QUE PRODUCTOS SE VENDIERON EN LA COMPRA CON CORRELATIVO 56
SELECT fact.idFactura, pro.nombreProducto, 
	vf.cantidad, pro.precioUnidad, (vf.cantidad * pro.precioUnidad) as totalFila
FROM factura fact, ventaFactura vf, producto pro
WHERE fact.idFactura = vf.idFactura 
	AND vf.idProducto = pro.idProducto
	AND fact.idFactura = 56;

-- cuantos productos llevo el cliente en la factura 56
SELECT fact.idFactura, SUM(vf.cantidad)
FROM factura fact, ventaFactura vf, producto pro
WHERE fact.idFactura = vf.idFactura 
	AND vf.idProducto = pro.idProducto
	AND fact.idFactura = 56
GROUP BY fact.idFactura;

-- cuantos productos diferentes llevo el cliente en la factura 56
SELECT fact.idFactura, COUNT (pro.nombreProducto)
FROM factura fact, ventaFactura vf, producto pro
WHERE fact.idFactura = vf.idFactura 
	AND vf.idProducto = pro.idProducto
	AND fact.idFactura = 56
GROUP BY fact.idFactura;

--MOSTRAR EL TOTAL FINAL DE LA FACTURA 56:
SELECT fact.idFactura, SUM (vf.cantidad * pro.precioUnidad) as total
FROM factura fact, ventaFactura vf, producto pro
WHERE fact.idFactura = vf.idFactura 
	AND vf.idProducto = pro.idProducto
	AND fact.idFactura = 56
GROUP BY fact.idFactura;





----------------------------------------------------------------
--CLASE 16
----------------------------------------------------------------
--Mostrar el detalle de cada factura, incluyendo el id y nombre del cliente, los productos llevados, cantidad
--16.1 precio unidad y total por cada fila.
SELECT fact.idFactura, c.idcliente, c.nombreCliente, pro.nombreProducto, 
	vf.cantidad, pro.precioUnidad, (vf.cantidad * pro.precioUnidad) as totalFila
FROM factura fact, ventaFactura vf, producto pro, cliente c
WHERE fact.idFactura = vf.idFactura 
	AND vf.idProducto = pro.idProducto
	AND c.idCliente = fact.idCliente
ORDER BY c.idCliente ASC;


--16.2 Mostrar el total de cada factura ordenando en base al cliente.
SELECT fact.idFactura, c.idcliente, c.nombreCliente,  
	SUM (vf.cantidad * pro.precioUnidad) as totalFila
FROM factura fact, ventaFactura vf, producto pro, cliente c
WHERE fact.idFactura = vf.idFactura 
	AND vf.idProducto = pro.idProducto
	AND c.idCliente = fact.idCliente
GROUP BY fact.idFactura, c.idcliente, c.nombreCliente
ORDER BY c.idCliente ASC;


--16.3 basandose en la consulta 16.1, mostrar el promedio de compra de cada cliente.
SELECT c.idcliente, c.nombreCliente,  
	AVG (vf.cantidad * pro.precioUnidad) as totalFila
FROM factura fact, ventaFactura vf, producto pro, cliente c
WHERE fact.idFactura = vf.idFactura 
	AND vf.idProducto = pro.idProducto
	AND c.idCliente = fact.idCliente
GROUP BY  c.idcliente, c.nombreCliente
ORDER BY c.idCliente ASC;

--16.3b basandose en la consulta 16.1, mostrar el promedio de compra de cada cliente.
SELECT c.idcliente, c.nombreCliente,  
	ROUND(AVG (vf.cantidad * pro.precioUnidad),2) as totalFila
FROM factura fact, ventaFactura vf, producto pro, cliente c
WHERE fact.idFactura = vf.idFactura 
	AND vf.idProducto = pro.idProducto
	AND c.idCliente = fact.idCliente
GROUP BY  c.idcliente, c.nombreCliente
ORDER BY c.idCliente ASC;



--HAVING
--16.4 Mostrar la cantidad de ventas realizada por cada empleado.
SELECT emp.nombreEmpleado, count(fact.idFactura) cantidadVendida
FROM empleado emp, factura fact
WHERE emp.idEmpleado = fact.idEmpleado
GROUP BY emp.nombreEmpleado
ORDER BY emp.nombreEmpleado ASC;

--16.5 Mostrar la lista de empleados que hayan realizado mas de 5 ventas
SELECT emp.nombreEmpleado, count(fact.idFactura) cantidadVendida
FROM empleado emp, factura fact
WHERE emp.idEmpleado = fact.idEmpleado AND count(fact.idFactura) > 5
GROUP BY emp.nombreEmpleado
ORDER BY cantidadVendida DESC;

SELECT emp.nombreEmpleado, count(fact.idFactura) cantidadVendida
FROM empleado emp, factura fact
WHERE emp.idEmpleado = fact.idEmpleado
GROUP BY emp.nombreEmpleado
HAVING count(fact.idFactura) > 5
ORDER BY cantidadVendida DESC;

--16.6 Mostrar el promedio de compra de cada cliente cuyo calor de promedio sea mayor a $200 y menos a $400
SELECT c.idcliente, c.nombreCliente,  
	ROUND(AVG (vf.cantidad * pro.precioUnidad),2) as totalFila
FROM factura fact, ventaFactura vf, producto pro, cliente c
WHERE fact.idFactura = vf.idFactura 
	AND vf.idProducto = pro.idProducto
	AND c.idCliente = fact.idCliente
GROUP BY  c.idcliente, c.nombreCliente
HAVING ROUND(AVG (vf.cantidad * pro.precioUnidad),2) > 200 
	AND ROUND(AVG (vf.cantidad * pro.precioUnidad),2) < 400 
ORDER BY c.idCliente ASC;

--16.7 mostrar el total vendido por empleado
SELECT e.idEmpleado, e.nombreEmpleado, SUM (vf.cantidad * p.precioUnidad) as total
FROM empleado e, factura f, ventaFactura vf, producto p
WHERE e.idEmpleado = f.idEmpleado 
	AND f.idFactura = vf.idFactura
	AND vf.idProducto = p.idProducto
GROUP BY e.idEmpleado, e.nombreEmpleado
ORDER BY e.idEmpleado;

--16.8 Guardar el resultado anterior en una tabla llamada VENTAEMPLEADO
SELECT e.idEmpleado, e.nombreEmpleado, SUM (vf.cantidad * p.precioUnidad) as total
INTO ventaempleado
FROM empleado e, factura f, ventaFactura vf, producto p
WHERE e.idEmpleado = f.idEmpleado 
	AND f.idFactura = vf.idFactura
	AND vf.idProducto = p.idProducto
GROUP BY e.idEmpleado, e.nombreEmpleado
ORDER BY e.idEmpleado;

SELECT * FROM ventaempleado;