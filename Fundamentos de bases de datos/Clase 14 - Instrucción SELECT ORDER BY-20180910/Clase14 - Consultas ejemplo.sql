--MOSTRAR A LOS EMPLEADOS EN ORDEN DE MAYOR A MENOR SALARIO 
SELECT emp.idEmpleado, emp.nombreEmpleado, emp.salario
FROM empleado as emp
ORDER BY emp.salario DESC;

--MOSTRAR LOS PRODUCTOS DEL MAS BARATO AL MAS CARO
SELECT idProducto, nombreProducto, descripcion, precioUnidad
FROM producto
ORDER BY precioUnidad ASC;

--MOSTRAR LA LISTA DE PRODUCTOS VENDIDOS EN CADA FACTURA
SELECT fact.idFactura, pro.nombreProducto, pro.precioUnidad, vf.cantidad
FROM FACTURA AS fact, ventaFactura AS vf, producto as pro
WHERE fact.idFactura = vf.idFactura 
	AND pro.idProducto = vf.idProducto;

--MOSTRAR EL TOTAL VENDIDO DE CADA PRODUCTO DE MANERA ORDENADA

SELECT fact.idFactura, pro.nombreProducto, pro.precioUnidad, 
	vf.cantidad, (pro.precioUnidad*vf.cantidad) as totalProducto
FROM FACTURA AS fact, ventaFactura AS vf, producto as pro
WHERE fact.idFactura = vf.idFactura 
	AND vf.idProducto = pro.idProducto;

--MOSTRAR EL TOTAL VENDIDO DE CADA PRODUCTO ORDENADO POR FACTURA 
--Y CADA FACTURA ORDENADO POR TOTALFACTURA
SELECT fact.idFactura, pro.nombreProducto, pro.precioUnidad, vf.cantidad, 
	(pro.precioUnidad*vf.cantidad) as totalProducto
FROM FACTURA AS fact, ventaFactura AS vf, producto as pro
WHERE fact.idFactura = vf.idFactura 
	AND vf.idProducto = pro.idProducto
ORDER BY fact.idFactura ASC, (pro.precioUnidad*vf.cantidad) ASC;
