--declarando variables P-SQL
DECLARE @variable INT
SET @variable = 10
PRINT @variable

--mostrandro a los empleados del departamento de ventas:
DECLARE @depto VARCHAR(10)
SET @depto = 'ventas'
SELECT E.idEmpleado, E.nombreEmpleado, D.nombreDepto
	FROM empleado E, departamento D
	WHERE E.idDepto = D.idDepto AND D.nombreDepto = @depto;

--¿Que empleado vendio mas?
SELECT e.idEmpleado, e.nombreEmpleado, SUM (vf.cantidad * p.precioUnidad) as total
FROM empleado e, factura f, ventaFactura vf, producto p
WHERE e.idEmpleado = f.idEmpleado 
	AND f.idFactura = vf.idFactura
	AND vf.idProducto = p.idProducto
GROUP BY e.idEmpleado, e.nombreEmpleado
HAVING SUM (vf.cantidad * p.precioUnidad) = 
(SELECT MAX(ventas.total) 
 FROM (
	SELECT e.idEmpleado, e.nombreEmpleado, SUM (vf.cantidad * p.precioUnidad) as total
	FROM empleado e, factura f, ventaFactura vf, producto p
	WHERE e.idEmpleado = f.idEmpleado 
		AND f.idFactura = vf.idFactura
		AND vf.idProducto = p.idProducto
	GROUP BY e.idEmpleado, e.nombreEmpleado
) AS ventas)


--¿Que empleado vendio mas? Version 2
--DECLARACION DE VARIABLES.
DECLARE @ventaMayor FLOAT
DECLARE @tablaVentas TABLE(
    idEmpleado INT,
    nombreEmpleado VARCHAR(50),
	total FLOAT
)
--ASIGNACION DE DATOS:
--ASIGNANDO TABLA DE EMPLEADOS A VARIABLE TABLA
INSERT INTO  @tablaVentas (idEmpleado, nombreEmpleado, total)
SELECT e.idEmpleado, e.nombreEmpleado, SUM (vf.cantidad * p.precioUnidad) as total
FROM empleado e, factura f, ventaFactura vf, producto p
WHERE e.idEmpleado = f.idEmpleado 
	AND f.idFactura = vf.idFactura
	AND vf.idProducto = p.idProducto
GROUP BY e.idEmpleado, e.nombreEmpleado
--OBTENIENDO MAYOR VALOR DE VENTAS
SELECT  @ventaMayor = MAX(ventas.total) FROM @tablaVentas AS ventas
--QUIEN VENDIO MAS:
SELECT e.idEmpleado, e.nombreEmpleado, SUM (vf.cantidad * p.precioUnidad) as total
FROM empleado e, factura f, ventaFactura vf, producto p
WHERE e.idEmpleado = f.idEmpleado 
	AND f.idFactura = vf.idFactura
	AND vf.idProducto = p.idProducto
GROUP BY e.idEmpleado, e.nombreEmpleado
HAVING SUM (vf.cantidad * p.precioUnidad) = @ventaMayor


--¿Que empleado vendio mas? Version 3
--DECLARACION DE VARIABLES.
DECLARE @ventaMayor FLOAT
DECLARE @idEmpleado INT
DECLARE @nombre VARCHAR(50)
DECLARE @tablaVentas TABLE(
    idEmpleado INT,
    nombreEmpleado VARCHAR(50),
	total FLOAT
)
--ASIGNACION DE DATOS:
--ASIGNANDO TABLA DE EMPLEADOS A VARIABLE TABLA
INSERT INTO  @tablaVentas (idEmpleado, nombreEmpleado, total)
SELECT e.idEmpleado, e.nombreEmpleado, SUM (vf.cantidad * p.precioUnidad) as total
FROM empleado e, factura f, ventaFactura vf, producto p
WHERE e.idEmpleado = f.idEmpleado 
	AND f.idFactura = vf.idFactura
	AND vf.idProducto = p.idProducto
GROUP BY e.idEmpleado, e.nombreEmpleado
--OBTENIENDO MAYOR VALOR DE VENTAS
SELECT  @ventaMayor = MAX(ventas.total) FROM @tablaVentas AS ventas
--QUIEN VENDIO MAS:
SELECT @idEmpleado=e.idEmpleado, @nombre= e.nombreEmpleado
FROM empleado e, factura f, ventaFactura vf, producto p
WHERE e.idEmpleado = f.idEmpleado 
	AND f.idFactura = vf.idFactura
	AND vf.idProducto = p.idProducto
GROUP BY e.idEmpleado, e.nombreEmpleado
HAVING SUM (vf.cantidad * p.precioUnidad) = @ventaMayor
PRINT CONCAT('el empleado que mas ventas realizò: ', @idempleado, '-', @nombre, ', con la cantidad de: ', @ventaMayor)


--INSTRUCCION IF
--EJERCICIO 1 IF
DECLARE @variable INT
SET @variable = 10
IF @variable = 10
	PRINT 'la variable es igual 10'
ELSE
	PRINT 'la variable es diferente de 10'


--EJERCICIO 2 IF: Definiciendo bloques.
DECLARE @variable INT
SET @variable = 10
IF @variable = 10
	BEGIN
		PRINT 'variable '
		PRINT 'es igual a '
		PRINT '10'
	END
ELSE
	PRINT 'variable es diferente de 10'


--EJERCICIO 3 IF
SELECT e.idEmpleado, e.nombreEmpleado, e.salario, 
	CASE e.idDepto
        WHEN 1 THEN 'ventas'
        WHEN 2 THEN 'recursos humanos'
		WHEN 3 THEN 'Administracion'
    END
FROM empleado e;

--EJERJCICIO 
INSERT INTO cliente (nombreCliente, ciudad) VALUES('Giselle', 'Ajmeer');

DECLARE @suma INT
DECLARE @idCliente INT
SELECT @idCliente= c.idCliente, @suma = COUNT(f.idFactura)
FROM cliente c
INNER JOIN factura f
ON c.idCliente = f.idCliente
WHERE f.idCliente = 10
GROUP BY c.idCliente;
IF  @suma > 0 
	PRINT CONCAT('el cliente con id: ', @idCliente , ', ha comprado ',@suma,' veces en nuestra sucursal.')
ELSE
	PRINT 'Este cliente no ha realizado ninguna compra aun'




--while
DECLARE @contador INT
SET @contador  = 1
WHILE @contador < 10
	BEGIN
		PRINT 'el valor del contador es '+CONVERT(VARCHAR(2), @contador)
		SET @contador = @contador + 1
	END

DECLARE @contador INT
SET @contador  = 1
WHILE @contador < 10
	BEGIN
		IF @contador = 5
			BEGIN
			SET @contador = @contador + 1
			BREAK
			END
		PRINT 'el valor del contador es '+CONVERT(VARCHAR(2), @contador)
		SET @contador = @contador + 1
	END

DECLARE @contador INT
SET @contador  = 1
WHILE @contador < 10
	BEGIN
		IF @contador = 5
			BEGIN
			SET @contador = @contador + 1
			CONTINUE
			END
		PRINT 'el valor del contador es '+CONVERT(VARCHAR(2), @contador)
		SET @contador = @contador + 1
	END
 