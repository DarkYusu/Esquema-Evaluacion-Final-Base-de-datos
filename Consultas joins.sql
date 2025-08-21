-- a. Realice una consulta que permita listar todas las capacitaciones de
-- un cliente en particular, indicando el nombre completo, la edad y
-- el correo electrónico de los asistentes.
SELECT 
	idcapacitacion AS id_capacitacion,
    clinombres AS nombre_cliente,
    cliapllidos AS apellido_cliente,
    asistnombrecompleto AS nombre_asistente,
    asistedad AS edad_asistente,
    asiscorreo AS correo_asistente
FROM cliente
INNER JOIN capacitacion
    ON rutcliente = cliente_rutcliente
INNER JOIN asistentes  
    ON idcapacitacion = capacitacion_idcapacitacion
    WHERE rutcliente = 102;
    
-- b. Realice una consulta que permita desplegar todas las visitas en
-- terreno realizadas a los clientes que sean de la comuna de
-- Valparaíso. Por cada visita debe indicar todos los chequeos que se
-- hicieron en ella, junto con el estado de cumplimiento de cada uno.
SELECT 
    rutcliente AS rut_cliente,
    clinombres AS nombres_cliente,
    cliapllidos AS apellidos_cliente,
    idvisita AS id_visita,
    visfecha AS fecha_visita,
    vishora AS hora_visita,
    caplugar AS lugar_visita,
    nombrechequeo AS nombre_chequeo,-- se cambiara
    estadoCumplimiento AS estado_cumplimiento-- se cambiara
FROM
    cliente
        JOIN
    visita ON rutcliente = cliente_rutcliente
        JOIN
    visita_chequeo ON idvisita = visita_id
        JOIN
    chequeo ON chequeo_id = idchequeo -- se cambiara
WHERE
    clicomuna = 'Valparaiso'; -- depende de los datos ingresados
    
-- c. Realice una consulta que despliegue los accidentes registrados
-- para todos los clientes, indicando los datos de detalle del
-- accidente, y el nombre, apellido, RUT y teléfono del cliente al que
-- se asocia dicha situación.
SELECT
    idaccidente AS id_accidente,
    accifecha AS fecha_accidente,
    accihora AS hora_accidente,
    accilugar AS lugar_accidente,
    acciorigen AS origen_accidente,
    acciconsecuencias AS consecuencias_accidente,
    rutcliente AS rut_cliente,
    clinombres AS nombres_cliente,
    cliapllidos AS apellidos_cliente,
    clitelefono AS telefono_cliente
FROM
    accidente
JOIN
    cliente ON cliente_rutcliente = rutcliente;