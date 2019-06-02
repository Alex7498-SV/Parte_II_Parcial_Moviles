-----------------------------------------------
---- CLASE 16
------------------------------------------------
-----------------------------------------------
--EJERCICIO 1
-----------------------------------------------
--TABLA BASE: muestra las ventas de cada empleado
SELECT e.idEmpleado, e.nombreEmpleado, SUM (vf.cantidad * p.precioUnidad) as total
FROM empleado e, factura f, ventaFactura vf, producto p
WHERE e.idEmpleado = f.idEmpleado 
	AND f.idFactura = vf.idFactura
	AND vf.idProducto = p.idProducto
GROUP BY e.idEmpleado, e.nombreEmpleado

--Calculando quien vendiò màs ESTO DA ERROR
SELECT e.idEmpleado, e.nombreEmpleado, MAX(SUM (vf.cantidad * p.precioUnidad)) as total
FROM empleado e, factura f, ventaFactura vf, producto p
WHERE e.idEmpleado = f.idEmpleado 
	AND f.idFactura = vf.idFactura
	AND vf.idProducto = p.idProducto
GROUP BY e.idEmpleado, e.nombreEmpleado

--Calculando quien vendiò màs version 2
SELECT ventas.idEmpleado, ventas.nombreEmpleado, MAX(ventas.total) 
FROM (
	SELECT e.idEmpleado, e.nombreEmpleado, SUM (vf.cantidad * p.precioUnidad) as total
	FROM empleado e, factura f, ventaFactura vf, producto p
	WHERE e.idEmpleado = f.idEmpleado 
		AND f.idFactura = vf.idFactura
		AND vf.idProducto = p.idProducto
	GROUP BY e.idEmpleado, e.nombreEmpleado
) AS ventas
GROUP BY ventas.idEmpleado, ventas.nombreEmpleado;

--Calculando quien vendiò màs version 3
SELECT  MAX(ventas.total) 
FROM (
	SELECT e.idEmpleado, e.nombreEmpleado, SUM (vf.cantidad * p.precioUnidad) as total
	FROM empleado e, factura f, ventaFactura vf, producto p
	WHERE e.idEmpleado = f.idEmpleado 
		AND f.idFactura = vf.idFactura
		AND vf.idProducto = p.idProducto
	GROUP BY e.idEmpleado, e.nombreEmpleado
) AS ventas;

-- A partir de la tabla base calcular quien vendio mas
SELECT e.idEmpleado, e.nombreEmpleado, SUM (vf.cantidad * p.precioUnidad) as total
FROM empleado e, factura f, ventaFactura vf, producto p
WHERE e.idEmpleado = f.idEmpleado 
	AND f.idFactura = vf.idFactura
	AND vf.idProducto = p.idProducto
GROUP BY e.idEmpleado, e.nombreEmpleado
HAVING SUM (vf.cantidad * p.precioUnidad) = (SELECT MAX(ventas.total) 
FROM (
	SELECT e.idEmpleado, e.nombreEmpleado, SUM (vf.cantidad * p.precioUnidad) as total
	FROM empleado e, factura f, ventaFactura vf, producto p
	WHERE e.idEmpleado = f.idEmpleado 
		AND f.idFactura = vf.idFactura
		AND vf.idProducto = p.idProducto
	GROUP BY e.idEmpleado, e.nombreEmpleado
) AS ventas)

-----------------------------------------------
--EJERCICIO 2
-----------------------------------------------
--mostrar el detalle de cada factura
SELECT fact.idFactura, pro.nombreProducto, pro.precioUnidad, vf.cantidad, (pro.precioUnidad*vf.cantidad) as total
FROM FACTURA AS fact, ventaFactura AS vf, producto as pro
WHERE fact.idFactura = vf.idFactura 
	AND vf.idProducto = pro.idProducto
ORDER BY fact.idFactura ASC, total ASC;

--mostrar cada factura con el total de la venta (ESTE FALLA!)
SELECT fact.idFactura, SUM(pro.precioUnidad*vf.cantidad) as totalProducto
FROM FACTURA AS fact, ventaFactura AS vf, producto as pro
WHERE fact.idFactura = vf.idFactura 
	AND vf.idProducto = pro.idProducto
GROUP BY fact.idFactura
ORDER BY fact.idFactura ASC;

-- basado en el resultado anterior, mostrar el total de ventas:
SELECT SUM(SUM(pro.precioUnidad*vf.cantidad))
FROM FACTURA AS fact, ventaFactura AS vf, producto as pro
WHERE fact.idFactura = vf.idFactura 
	AND vf.idProducto = pro.idProducto;

SELECT SUM(detalleFactura.totalProducto) AS totalVentas
FROM (
	SELECT fact.idFactura, SUM(pro.precioUnidad*vf.cantidad) as totalProducto
	FROM FACTURA AS fact, ventaFactura AS vf, producto as pro
	WHERE fact.idFactura = vf.idFactura 
		AND vf.idProducto = pro.idProducto
	GROUP BY fact.idFactura
) AS detalleFactura

-----------------------------------------------
--EJERCICIO 3
-----------------------------------------------
--A partir de la tabla base crear una tabla con los datos del resultado llamada resultadoVentas
SELECT e.idEmpleado, e.nombreEmpleado, SUM (vf.cantidad * p.precioUnidad) as total
INTO resultadoVentas
FROM empleado e, factura f, ventaFactura vf, producto p
WHERE e.idEmpleado = f.idEmpleado 
	AND f.idFactura = vf.idFactura
	AND vf.idProducto = p.idProducto
GROUP BY e.idEmpleado, e.nombreEmpleado
ORDER BY e.idEmpleado;

SELECT * FROM resultadoVentas;

--Agregar una columna 'bono' a la tabla resultadoVentas
ALTER TABLE resultadoVentas ADD bono float;
SELECT * FROM resultadoVentas;

--agregar un bono de 200$ a los 5 empleados con mayores ventas
SELECT TOP 5 total
FROM resultadoVentas
ORDER BY total DESC

UPDATE resultadoVentas SET bono  = 200 + total
WHERE total IN (
				SELECT TOP(5) total
				FROM resultadoVentas
				ORDER BY total DESC
				)
select * from resultadoVentas order by total DESC;

--los 3 empleados con menos ventas seran trasladados al departamento
-- de administracion, eliminarlos de ventaTotal.
SELECT TOP(3) total
FROM resultadoVentas
ORDER BY total asc;

DELETE FROM resultadoVentas 
WHERE total IN 
			(
				SELECT TOP(3) total
				FROM resultadoVentas
				ORDER BY total asc
			)
SELECT * FROM resultadoVentas;

