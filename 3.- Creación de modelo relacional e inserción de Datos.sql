-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Modificacion de tablas y incorporacion de nuevas
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

-- 0) Preparación
SET FOREIGN_KEY_CHECKS = 0;

-- 1) Quitar FKs existentes del esquema original
ALTER TABLE `accidente`   DROP FOREIGN KEY `fk_accidente_cliente`;
ALTER TABLE `asistentes`  DROP FOREIGN KEY `fk_asistentes_capacitacion1`;
ALTER TABLE `capacitacion` DROP FOREIGN KEY `fk_capacitacion_cliente1`;
ALTER TABLE `visita`      DROP FOREIGN KEY `fk_capacitacion_cliente10`;

-- 2) Renombrar tablas a nombres finales
RENAME TABLE
  `cliente`   TO `clientes`,
  `visita`    TO `visitas`,
  `accidente` TO `accidentes`;

-- 3) Ajustar tablas existentes a la estructura final

-- clientes: tipos/renombres y nueva columna de FK a usuarios
ALTER TABLE `clientes`
  MODIFY `rutcliente` INT UNSIGNED NOT NULL,
  CHANGE `cliapllidos`  `cliapellidos` VARCHAR(50) NOT NULL,
  CHANGE `clidireccionl` `clidireccion` VARCHAR(100) NOT NULL,
  ADD COLUMN `Usuarios_idusuario` INT UNSIGNED NOT NULL AFTER `cliedad`;

-- asistentes: unsigned, renombres, longitudes
ALTER TABLE `asistentes`
  MODIFY `idasistentes` INT UNSIGNED NOT NULL,
  CHANGE `asiscorreo` `asistcorreo` VARCHAR(70) NULL,
  MODIFY `asisttelefono` VARCHAR(20) NULL,
  CHANGE `capacitacion_idcapacitacion` `Capacitacion_idcapacitacion` INT UNSIGNED NOT NULL;

-- capacitacion: unsigned, NOT NULL y renombre de columna FK
ALTER TABLE `capacitacion`
  MODIFY `idcapacitacion` INT UNSIGNED NOT NULL,
  MODIFY `capduracion` DECIMAL(4,0) NOT NULL,
  CHANGE `cliente_rutcliente` `Clientes_rutcliente` INT UNSIGNED NOT NULL;

-- accidentes: unsigned y renombre de columna FK
ALTER TABLE `accidentes`
  MODIFY `idaccidente` INT UNSIGNED NOT NULL,
  CHANGE `cliente_rutcliente` `Clientes_rutcliente` INT UNSIGNED NOT NULL;

-- visitas: unsigned, renombre de lugar y de columna FK
ALTER TABLE `visitas`
  MODIFY `idvisita` INT UNSIGNED NOT NULL,
  CHANGE `caplugar` `vislugar` VARCHAR(50) NOT NULL,
  CHANGE `cliente_rutcliente` `Clientes_rutcliente` INT UNSIGNED NOT NULL;

-- 4) Crear tablas nuevas del esquema final

CREATE TABLE `usuarios` (
  `idusuario` INT UNSIGNED NOT NULL,
  `usuanombre` VARCHAR(35) NOT NULL,
  `usuaapellido` VARCHAR(35) NOT NULL,
  `usufechanacimiento` DATE NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `profesionales` (
  `rutprofesional` INT UNSIGNED NOT NULL,
  `profnombres` VARCHAR(35) NOT NULL,
  `profapellidos` VARCHAR(35) NOT NULL,
  `proftelefono` VARCHAR(15) NOT NULL,
  `proftitulo` VARCHAR(50) NOT NULL,
  `profproyecto` VARCHAR(50) NOT NULL,
  `Usuarios_idusuario` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`rutprofesional`),
  KEY `fk_Profesionales_Usuarios1_idx` (`Usuarios_idusuario`),
  CONSTRAINT `fk_Profesionales_Usuarios1` FOREIGN KEY (`Usuarios_idusuario`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `administrativo` (
  `rutadministrativo` INT NOT NULL,
  `adminombre` VARCHAR(50) NOT NULL,
  `admiapellido` VARCHAR(50) NOT NULL,
  `admicorreo` VARCHAR(50) NOT NULL,
  `adminombrearea` VARCHAR(50) NOT NULL,
  `Usuarios_idusuario` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`rutadministrativo`),
  KEY `fk_Administrativo_Usuarios1_idx` (`Usuarios_idusuario`),
  CONSTRAINT `fk_Administrativo_Usuarios1` FOREIGN KEY (`Usuarios_idusuario`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `asesorias` (
  `idasesoria` INT UNSIGNED NOT NULL,
  `asesfecha` DATE NOT NULL,
  `asesmotivo` VARCHAR(70) NOT NULL,
  `Profesionales_rutprofesional` INT UNSIGNED NOT NULL,
  `Clientes_rutcliente` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idasesoria`),
  KEY `fk_Asesorias_Profesionales1_idx` (`Profesionales_rutprofesional`),
  KEY `fk_Asesorias_Clientes1_idx` (`Clientes_rutcliente`),
  CONSTRAINT `fk_Asesorias_Profesionales1` FOREIGN KEY (`Profesionales_rutprofesional`) REFERENCES `profesionales` (`rutprofesional`),
  CONSTRAINT `fk_Asesorias_Clientes1` FOREIGN KEY (`Clientes_rutcliente`) REFERENCES `clientes` (`rutcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `chequeos` (
  `idchequeo` INT UNSIGNED NOT NULL,
  `cheqnombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idchequeo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `pagos` (
  `idpagos` INT NOT NULL AUTO_INCREMENT,
  `pagfecha` DATE NOT NULL,
  `pagmonto` INT NOT NULL,
  `pagmes` VARCHAR(10) NOT NULL,
  `pagano` YEAR NOT NULL,
  `Clientes_rutcliente` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idpagos`),
  KEY `fk_Pagos_Clientes1_idx` (`Clientes_rutcliente`),
  CONSTRAINT `fk_Pagos_Clientes1` FOREIGN KEY (`Clientes_rutcliente`) REFERENCES `clientes` (`rutcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `recomendaciones` (
  `idrecomendacion` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `recomtitulo` VARCHAR(50) NOT NULL,
  `recomdescripcion` VARCHAR(100) NOT NULL,
  `recomplazosolucion` INT NOT NULL,
  `Asesorias_idasesoria` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idrecomendacion`),
  KEY `fk_Recomendaciones_Asesorias1_idx` (`Asesorias_idasesoria`),
  CONSTRAINT `fk_Recomendaciones_Asesorias1` FOREIGN KEY (`Asesorias_idasesoria`) REFERENCES `asesorias` (`idasesoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `visitas_has_chequeos` (
  `Visitas_idvisita` INT UNSIGNED NOT NULL,
  `Chequeos_idchequeo` INT UNSIGNED NOT NULL,
  `estado` ENUM('cumple','cumple con observaciones','no cumple') NOT NULL,
  PRIMARY KEY (`Visitas_idvisita`, `Chequeos_idchequeo`),
  KEY `fk_Visitas_has_Chequeos_Chequeos1_idx` (`Chequeos_idchequeo`),
  KEY `fk_Visitas_has_Chequeos_Visitas1_idx` (`Visitas_idvisita`),
  CONSTRAINT `fk_Visitas_has_Chequeos_Chequeos1` FOREIGN KEY (`Chequeos_idchequeo`) REFERENCES `chequeos` (`idchequeo`),
  CONSTRAINT `fk_Visitas_has_Chequeos_Visitas1` FOREIGN KEY (`Visitas_idvisita`) REFERENCES `visitas` (`idvisita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 5) Renombrar índices heredados para que coincidan con el dump final
ALTER TABLE `asistentes`  RENAME INDEX `fk_asistentes_capacitacion1_idx` TO `fk_Asistentes_Capacitacion1_idx`;
ALTER TABLE `capacitacion` RENAME INDEX `fk_capacitacion_cliente1_idx`   TO `fk_Capacitacion_Clientes_idx`;
ALTER TABLE `visitas`     RENAME INDEX `fk_capacitacion_cliente1_idx`   TO `fk_Visitas_Clientes1_idx`;
ALTER TABLE `accidentes`  RENAME INDEX `fk_accidente_cliente_idx`       TO `fk_Accidentes_Clientes1_idx`;

-- 6) Crear FKs finales en tablas existentes
ALTER TABLE `clientes`
  ADD KEY `fk_Clientes_Usuarios1_idx` (`Usuarios_idusuario`),
  ADD CONSTRAINT `fk_Clientes_Usuarios1` FOREIGN KEY (`Usuarios_idusuario`) REFERENCES `usuarios` (`idusuario`);

ALTER TABLE `capacitacion`
  ADD CONSTRAINT `fk_Capacitacion_Clientes` FOREIGN KEY (`Clientes_rutcliente`) REFERENCES `clientes` (`rutcliente`);

ALTER TABLE `accidentes`
  ADD CONSTRAINT `fk_Accidentes_Clientes1` FOREIGN KEY (`Clientes_rutcliente`) REFERENCES `clientes` (`rutcliente`);

ALTER TABLE `asistentes`
  ADD CONSTRAINT `fk_Asistentes_Capacitacion1` FOREIGN KEY (`Capacitacion_idcapacitacion`) REFERENCES `capacitacion` (`idcapacitacion`);

ALTER TABLE `visitas`
  ADD CONSTRAINT `fk_Visitas_Clientes1` FOREIGN KEY (`Clientes_rutcliente`) REFERENCES `clientes` (`rutcliente`);

-- 7) Finalizar
SET FOREIGN_KEY_CHECKS = 1;

-- !!!!!!!!!!!!!!!!!!
-- Insersion de datos
-- !!!!!!!!!!!!!!!!!!

-- 1. Usuarios
INSERT INTO usuarios(idusuario, usuanombre, usuaapellido, usufechanacimiento) VALUES
(1, 'Juan', 'Pérez Soto', '1988-05-12'),
(2, 'María', 'López Díaz', '1990-09-20'),
(3, 'Carlos', 'Martínez Rojas', '1985-01-30'),
(4, 'Ana', 'Gutiérrez Fuentes', '1992-11-10'),
(5, 'Diego', 'Ramírez Salas', '1987-03-18'),
(6, 'Paula', 'Morales Torres', '1991-07-25');

-- 2. clientes
INSERT INTO clientes (rutcliente, clinombres, cliapellidos, clitelefono, cliafp, clisistemasalud, clidireccion, clicomuna, cliedad, Usuarios_idusuario)
VALUES
(101, 'Juan', 'Pérez Soto', '987654321', 'AFP Habitat', 1, 'Av. Principal 123', 'Santiago', 35, 1),
(102, 'María', 'López Díaz', '912345678', 'AFP Provida', 2, 'Calle Secundaria 456', 'Valparaíso', 42, 2),
(103, 'Carlos', 'Martínez Rojas', '998877665', 'AFP Cuprum', 1, 'Av. Central 789', 'Concepción', 29, 3);

-- 3. Insertar capacitaciones
INSERT INTO capacitacion (idcapacitacion, capfecha, caphora, caplugar, capduracion, Clientes_rutcliente)
VALUES
(201, '2025-08-01', '10:00:00', 'Sala Norte', 120, 101),
(202, '2025-08-05', '15:30:00', 'Sala Sur', 90, 102),
(203, '2025-08-10', '09:00:00', 'Auditorio Central', 180, 103);

-- 4. Insertar asistentes
INSERT INTO asistentes (idasistentes, asistnombrecompleto, asistedad, asistcorreo, asisttelefono, Capacitacion_idcapacitacion)
VALUES
(301, 'Pedro González', 28, 'pedro.gonzalez@mail.com', '911223344', 201),
(302, 'Lucía Ramírez', 32, 'lucia.ramirez@mail.com', '933445566', 202),
(303, 'Andrés Silva', 40, 'andres.silva@mail.com', '977889900', 203);

-- 5. Insertar accidentes
INSERT INTO accidentes (idaccidente, accifecha, accihora, accilugar, acciorigen, acciconsecuencias, Clientes_rutcliente)
VALUES
(401, '2025-08-02', '14:15:00', 'Bodega Central', 'Caída de carga', 'Lesión leve en pierna', 101),
(402, '2025-08-06', '11:45:00', 'Planta Norte', 'Falla eléctrica', 'Quemadura leve', 102),
(403, '2025-08-12', '08:20:00', 'Zona de carga', 'Resbalón', 'Esguince de tobillo', 103);

-- 6. Insertar visitas
INSERT INTO visitas (idvisita, visfecha, vishora, vislugar, viscomentarios, Clientes_rutcliente)
VALUES
(501, '2025-08-03', '09:30:00', 'Planta Santiago', 'Revisión de seguridad mensual', 101),
(502, '2025-08-07', '16:00:00', 'Planta Valparaíso', 'Seguimiento de capacitación', 102),
(503, '2025-08-11', '10:15:00', 'Planta Concepción', 'Inspección general', 103);

-- 7. Administrativos
INSERT INTO administrativo (rutadministrativo, adminombre, admiapellido, admicorreo, adminombrearea, Usuarios_idusuario)
VALUES
(104, 'Claudia', 'Reyes Soto', 'claudia.reyes@empresa.cl', 'Recursos Humanos', 4),
(105, 'Luis', 'Fernández Pino', 'luis.fernandez@empresa.cl', 'Finanzas', 5),
(106, 'Sofía', 'Castro Aguilar', 'sofia.castro@empresa.cl', 'Prevención de Riesgos', 6);

-- 8. Profesionales
INSERT INTO profesionales (rutprofesional, profnombres, profapellidos, proftelefono, proftitulo, profproyecto, Usuarios_idusuario) VALUES
(107, 'Gabriel', 'Muñoz Rivas', '987654321', 'Ingeniero en Prevención de Riesgos', 'Proyecto A', 4),
(108, 'Camila', 'Herrera Soto', '912345678', 'Ingeniera Civil Industrial', 'Proyecto B', 5),
(109, 'Felipe', 'Araya López', '976543210', 'Ingeniero Ambiental', 'Proyecto C', 6);

-- 9. Chequeos
INSERT INTO chequeos (idchequeo, cheqnombre) VALUES
(1,'Revisión de extintores'),
(2,'Chequeo de señalización'),
(3,'Control de salidas de emergencia');

-- 10. Pagos de clientes
INSERT INTO pagos (idpagos, pagfecha, pagmonto, pagmes, pagano, Clientes_rutcliente) VALUES
(1,'2025-08-01', 120000, 7, 2025, 101),
(2,'2025-08-05', 130000, 7, 2025, 102),
(3,'2025-08-10', 150000, 8, 2025, 103);

-- 11. Asesorías
INSERT INTO asesorias (idasesoria, asesfecha, asesmotivo, Profesionales_rutprofesional,Clientes_rutcliente) VALUES
(1,'2025-08-12', 'Revisión de protocolos de seguridad', 107, 101),
(2,'2025-08-13', 'Evaluación de riesgos eléctricos', 108, 102),
(3,'2025-08-14', 'Control de emisiones contaminantes', 109, 103); 

-- 12. Actividades de recomendaciones
INSERT INTO recomendaciones (idrecomendacion, recomtitulo, recomdescripcion, recomplazosolucion, Asesorias_idasesoria) VALUES
(1,'Capacitación en uso de extintores', 'Instruir al personal sobre el uso adecuado de extintores.', 15, 1),
(2,'Reparación de cableado defectuoso', 'Reemplazar cableado en mal estado en planta norte.', 10, 2),
(3,'Instalación de filtros adicionales', 'Colocar filtros para reducción de emisiones.', 20, 3);

-- 13. Relación visita - chequeo
INSERT INTO  visitas_has_chequeos (Visitas_idvisita, Chequeos_idchequeo, estado) VALUES
(501, 1, 'Cumple'),
(502, 2, 'Cumple con Observaciones'),
(503, 3, 'No Cumple');