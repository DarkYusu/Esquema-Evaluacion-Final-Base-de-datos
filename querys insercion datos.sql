--  Insertar clientes
INSERT INTO cliente (rutcliente, clinombres, cliapllidos, clitelefono, cliafp, clisistemasalud, clidireccionl, clicomuna, cliedad)
VALUES
(10132432, 'Juan', 'Pérez Soto', '987654321', 'AFP Habitat', 1, 'Av. Principal 123', 'Santiago', 35),
(10234332, 'María', 'López Díaz', '912345678', 'AFP Provida', 2, 'Calle Secundaria 456', 'Valparaíso', 42),
(10323423, 'Carlos', 'Martínez Rojas', '998877665', 'AFP Cuprum', 1, 'Av. Central 789', 'Concepción', 29);

--  Insertar capacitaciones
INSERT INTO capacitacion (idcapacitacion, capfecha, caphora, caplugar, capduracion, cliente_rutcliente)
VALUES
(1, '2025-08-01', '10:00:00', 'Sala Norte', 120, 10132432),
(2, '2025-08-05', '15:30:00', 'Sala Sur', 90, 10234332),
(3, '2025-08-10', '09:00:00', 'Auditorio Central', 180, 10323423);

--  Insertar asistentes
INSERT INTO asistentes (idasistentes, asistnombrecompleto, asistedad, asiscorreo, asisttelefono, capacitacion_idcapacitacion)
VALUES
(1, 'Pedro González', 28, 'pedro.gonzalez@mail.com', '911223344', 1),
(2, 'Lucía Ramírez', 32, 'lucia.ramirez@mail.com', '933445566', 2),
(3, 'Andrés Silva', 40, 'andres.silva@mail.com', '977889900', 3);

--  Insertar accidentes
INSERT INTO accidente (idaccidente, accifecha, accihora, accilugar, acciorigen, acciconsecuencias, cliente_rutcliente)
VALUES
(1, '2025-08-02', '14:15:00', 'Bodega Central', 'Caída de carga', 'Lesión leve en pierna', 10132432),
(2, '2025-08-06', '11:45:00', 'Planta Norte', 'Falla eléctrica', 'Quemadura leve', 10234332),
(3, '2025-08-12', '08:20:00', 'Zona de carga', 'Resbalón', 'Esguince de tobillo', 10323423);

--  Insertar visitas
INSERT INTO visita (idvisita, visfecha, vishora, caplugar, viscomentarios, cliente_rutcliente)
VALUES
(1, '2025-08-03', '09:30:00', 'Planta Santiago', 'Revisión de seguridad mensual', 10132432),
(2, '2025-08-07', '16:00:00', 'Planta Valparaíso', 'Seguimiento de capacitación', 10234332),
(3, '2025-08-11', '10:15:00', 'Planta Concepción', 'Inspección general', 10323423);
