-- a. Realice una consulta que permita listar todas las capacitaciones de
-- un cliente en particular, indicando el nombre completo, la edad y
-- el correo electrónico de los asistentes.
SELECT 
    idcapacitacion AS id_capacitacion,
    clinombres AS nombre_cliente,
    cliapellidos AS apellido_cliente,
    asistnombrecompleto AS nombre_asistente,
    asistedad AS edad_asistente,
    asistcorreo AS correo_asistente
FROM clientes
INNER JOIN capacitacion
    ON rutcliente = Clientes_rutcliente
INNER JOIN asistentes
    ON idcapacitacion = Capacitacion_idcapacitacion
WHERE rutcliente = 102;
    
-- b. Realice una consulta que permita desplegar todas las visitas en
-- terreno realizadas a los clientes que sean de la comuna de
-- Valparaíso. Por cada visita debe indicar todos los chequeos que se
-- hicieron en ella, junto con el estado de cumplimiento de cada uno.
SELECT 
    rutcliente AS rut_cliente,
    clinombres AS nombres_cliente,
    cliapellidos AS apellidos_cliente,
    idvisita AS id_visita,
    visfecha AS fecha_visita,
    vishora AS hora_visita,
    vislugar AS lugar_visita,
    cheqnombre AS nombre_chequeo,
    estado AS estado_cumplimiento
FROM Clientes
JOIN Visitas
    ON rutcliente = Clientes_rutcliente
JOIN Visitas_has_Chequeos vhc 
    ON idvisita = Visitas_idvisita
JOIN Chequeos ch 
    ON Chequeos_idchequeo = idchequeo
WHERE clicomuna = 'Valparaiso'
ORDER BY idvisita, cheqnombre;

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
    cliapellidos AS apellidos_cliente,
    clitelefono AS telefono_cliente
FROM accidentes
JOIN clientes
    ON Clientes_rutcliente = rutcliente;