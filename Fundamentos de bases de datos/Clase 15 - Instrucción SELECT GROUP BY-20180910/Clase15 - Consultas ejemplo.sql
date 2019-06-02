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