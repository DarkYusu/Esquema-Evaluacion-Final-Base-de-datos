-- 1. Usuarios
INSERT INTO usuarios(idusuario, usuanombre, usuaapellido, usufechanacimiento) VALUES
(1, 'Juan', 'Pérez Soto', '1988-05-12'),
(2, 'María', 'López Díaz', '1990-09-20'),
(3, 'Carlos', 'Martínez Rojas', '1985-01-30'),
(4, 'Ana', 'Gutiérrez Fuentes', '1992-11-10'),
(5, 'Diego', 'Ramírez Salas', '1987-03-18'),
(6, 'Paula', 'Morales Torres', '1991-07-25');

INSERT INTO clientes (rutcliente, clinombres, cliapellidos, clitelefono, cliafp, clisistemasalud, clidireccion, clicomuna, cliedad, Usuarios_idusuario)
VALUES
(101, 'Juan', 'Pérez Soto', '987654321', 'AFP Habitat', 1, 'Av. Principal 123', 'Santiago', 35, 1),
(102, 'María', 'López Díaz', '912345678', 'AFP Provida', 2, 'Calle Secundaria 456', 'Valparaíso', 42, 2),
(103, 'Carlos', 'Martínez Rojas', '998877665', 'AFP Cuprum', 1, 'Av. Central 789', 'Concepción', 29, 3);

-- 2. Insertar capacitaciones
INSERT INTO capacitacion (idcapacitacion, capfecha, caphora, caplugar, capduracion, Clientes_rutcliente)
VALUES
(201, '2025-08-01', '10:00:00', 'Sala Norte', 120, 101),
(202, '2025-08-05', '15:30:00', 'Sala Sur', 90, 102),
(203, '2025-08-10', '09:00:00', 'Auditorio Central', 180, 103);

-- 3. Insertar asistentes
INSERT INTO asistentes (idasistentes, asistnombrecompleto, asistedad, asistcorreo, asisttelefono, Capacitacion_idcapacitacion)
VALUES
(301, 'Pedro González', 28, 'pedro.gonzalez@mail.com', '911223344', 201),
(302, 'Lucía Ramírez', 32, 'lucia.ramirez@mail.com', '933445566', 202),
(303, 'Andrés Silva', 40, 'andres.silva@mail.com', '977889900', 203);

-- 4. Insertar accidentes
INSERT INTO accidentes (idaccidente, accifecha, accihora, accilugar, acciorigen, acciconsecuencias, Clientes_rutcliente)
VALUES
(401, '2025-08-02', '14:15:00', 'Bodega Central', 'Caída de carga', 'Lesión leve en pierna', 101),
(402, '2025-08-06', '11:45:00', 'Planta Norte', 'Falla eléctrica', 'Quemadura leve', 102),
(403, '2025-08-12', '08:20:00', 'Zona de carga', 'Resbalón', 'Esguince de tobillo', 103);

-- 5. Insertar visitas
INSERT INTO visitas (idvisita, visfecha, vishora, vislugar, viscomentarios, Clientes_rutcliente)
VALUES
(501, '2025-08-03', '09:30:00', 'Planta Santiago', 'Revisión de seguridad mensual', 101),
(502, '2025-08-07', '16:00:00', 'Planta Valparaíso', 'Seguimiento de capacitación', 102),
(503, '2025-08-11', '10:15:00', 'Planta Concepción', 'Inspección general', 103);

-- 3. Administrativos
INSERT INTO administrativo (rutadministrativo, adminombre, admiapellido, admicorreo, adminombrearea, Usuarios_idusuario)
VALUES
(104, 'Claudia', 'Reyes Soto', 'claudia.reyes@empresa.cl', 'Recursos Humanos', 4),
(105, 'Luis', 'Fernández Pino', 'luis.fernandez@empresa.cl', 'Finanzas', 5),
(106, 'Sofía', 'Castro Aguilar', 'sofia.castro@empresa.cl', 'Prevención de Riesgos', 6);

-- 4. Profesionales
INSERT INTO profesionales (rutprofesional, profnombres, profapellidos, proftelefono, proftitulo, profproyecto, Usuarios_idusuario) VALUES
(107, 'Gabriel', 'Muñoz Rivas', '987654321', 'Ingeniero en Prevención de Riesgos', 'Proyecto A', 4),
(108, 'Camila', 'Herrera Soto', '912345678', 'Ingeniera Civil Industrial', 'Proyecto B', 5),
(109, 'Felipe', 'Araya López', '976543210', 'Ingeniero Ambiental', 'Proyecto C', 6);

-- 5. Chequeos
-- revisar
INSERT INTO chequeos (idchequeo, cheqnombre) VALUES
(1,'Revisión de extintores'),
(2,'Chequeo de señalización'),
(3,'Control de salidas de emergencia');

-- 6. Pagos de clientes
INSERT INTO pagos (idpagos, pagfecha, pagmonto, pagmes, pagano, Clientes_rutcliente) VALUES
(1,'2025-08-01', 120000, 7, 2025, 101),
(2,'2025-08-05', 130000, 7, 2025, 102),
(3,'2025-08-10', 150000, 8, 2025, 103);

-- 7. Asesorías
-- revisar
INSERT INTO asesorias (idasesoria, asesfecha, asesmotivo, Profesionales_rutprofesional,Clientes_rutcliente) VALUES
(1,'2025-08-12', 'Revisión de protocolos de seguridad', 107, 101),
(2,'2025-08-13', 'Evaluación de riesgos eléctricos', 108, 102),
(3,'2025-08-14', 'Control de emisiones contaminantes', 109, 103); 

-- 8. Actividades de recomendaciones
INSERT INTO recomendaciones (idrecomendacion, recomtitulo, recomdescripcion, recomplazosolucion, Asesorias_idasesoria) VALUES
(1,'Capacitación en uso de extintores', 'Instruir al personal sobre el uso adecuado de extintores.', 15, 1),
(2,'Reparación de cableado defectuoso', 'Reemplazar cableado en mal estado en planta norte.', 10, 2),
(3,'Instalación de filtros adicionales', 'Colocar filtros para reducción de emisiones.', 20, 3);

-- 9. Relación visita - chequeo
INSERT INTO  visitas_has_chequeos (Visitas_idvisita, Chequeos_idchequeo, estado) VALUES
(501, 1, 'Cumple'),
(502, 2, 'Cumple con Observaciones'),
(503, 3, 'No Cumple');