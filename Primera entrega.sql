CREATE DATABASE agricultura;

USE agricultura;

CREATE TABLE lotes (
    id_lote INT AUTO_INCREMENT PRIMARY KEY,
    numero_lote VARCHAR(10) NOT NULL,
    ubicacion VARCHAR(50) NOT NULL,
    hectareas DECIMAL(5,2) NOT NULL,
    tipo_suelo VARCHAR(30)
);

INSERT INTO lotes (numero_lote, ubicacion, hectareas, tipo_suelo) VALUES
('L001', 'Junin', 12.50, 'Franco arenoso'),
('L002', 'Junin', 10.75, 'Arenoso'),
('L004', 'Chacabuco', 8.40, 'Arcilloso'),
('L001', 'Pergamino', 13.00, 'Limoso'),
('L003', 'Pergamino', 9.60, 'Franco limoso'),
('L001', 'Lincoln', 15.00, 'Franco arcilloso'),
('L004', 'Lincoln', 7.90, 'Franco');

SELECT * FROM lotes;

CREATE TABLE cultivos (
    id_cultivo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cultivo VARCHAR(30) NOT NULL,
    tipo_cultivo VARCHAR(20),
    ciclo_dias INT,
    necesidad_agua VARCHAR(20)
);

INSERT INTO cultivos (nombre_cultivo, tipo_cultivo, ciclo_dias, necesidad_agua) VALUES
('Maíz', 'Cereal', 120, 'Alta'),
('Soja', 'Oleaginosa', 130, 'Media'),
('Trigo', 'Cereal', 150, 'Media'),
('Girasol', 'Oleaginosa', 110, 'Baja'),
('Cebada', 'Cereal', 100, 'Media'),
('Alfalfa', 'Forrajera', 240, 'Alta');

SELECT * FROM cultivos;

CREATE TABLE siembras (
    id_siembra INT AUTO_INCREMENT PRIMARY KEY,
    id_lote INT NOT NULL,
    id_cultivo INT NOT NULL,
    fecha_siembra DATE NOT NULL,
    fecha_cosecha DATE,
    rendimiento_tn DECIMAL(6,2),
    
    FOREIGN KEY (id_lote) REFERENCES lotes(id_lote),
    FOREIGN KEY (id_cultivo) REFERENCES cultivos(id_cultivo)
    );
    
    INSERT INTO siembras (id_lote, id_cultivo, fecha_siembra, fecha_cosecha, rendimiento_tn) VALUES
(1, 1, '2024-10-01', '2025-02-10', 24.50),   -- Maíz en Lote 1
(2, 2, '2025-01-15', NULL, NULL),           -- Soja en Lote 2 (en proceso)
(3, 5, '2024-08-10', '2024-12-05', 18.30),   -- Cebada en Lote 3
(4, 3, '2024-09-01', '2025-01-20', 21.75),   -- Trigo en Lote 4
(5, 4, '2025-02-20', NULL, NULL),           -- Girasol en Lote 5 (recién sembrado)
(6, 6, '2024-03-10', '2024-11-30', 12.10),   -- Alfalfa en Lote 6
(7, 1, '2024-11-05', '2025-03-12', 19.80);   -- Maíz en Lote 7

CREATE TABLE trabajadores (
    id_trabajador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    dni VARCHAR(15) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    rol VARCHAR(30),
    fecha_ingreso DATE
);

INSERT INTO trabajadores (nombre, apellido, dni, telefono, rol, fecha_ingreso) VALUES
('Facundo', 'Astudillo', '29123456', '34151276', 'Capataz', '2021-04-12'),
('Sofía', 'Arevalo', '27456789', '30981234', 'Peón', '2022-09-05'),
('Martín', 'Vargas', '31876543', '31228765', 'Agrónomo', '2020-11-21'),
('Ramon', 'Benítez', '30543218', '25123498', 'Peón', '2023-01-15'),
('Bruno', 'Mendoza', '28765432', '36998763', 'Capataz', '2021-07-30');

CREATE TABLE insumos (
    id_insumo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    cantidad DECIMAL(10,2) NOT NULL,
    unidad_medida VARCHAR(20) NOT NULL,
    fecha_adquisicion DATE NOT NULL
);

INSERT INTO insumos (nombre, tipo, cantidad, unidad_medida, fecha_adquisicion) VALUES
('Fertilizante NPK 20-10-10', 'Fertilizante', 50.00, 'kg', '2024-03-15'),
('Semilla de Maíz Híbrido', 'Semilla', 100.00, 'kg', '2024-04-01'),
('Pesticida Glifosato', 'Plaguicida', 25.50, 'litros', '2024-02-20'),
('Semilla de Soja RR', 'Semilla', 80.00, 'kg', '2024-03-25'),
('Fertilizante Fosfato Monoamónico', 'Fertilizante', 40.00, 'kg', '2024-01-30'),
('Herbicida 2,4-D', 'Plaguicida', 15.00, 'litros', '2024-04-10');

CREATE TABLE aplicaciones_insumos (
    id_aplicacion INT AUTO_INCREMENT PRIMARY KEY,
    id_siembra INT NOT NULL,
    id_insumo INT NOT NULL,
    fecha_aplicacion DATE NOT NULL,
    cantidad_usada DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_siembra) REFERENCES siembras(id_siembra),
    FOREIGN KEY (id_insumo) REFERENCES insumos(id_insumo)
);

INSERT INTO aplicaciones_insumos (id_siembra, id_insumo, fecha_aplicacion, cantidad_usada) VALUES
(1, 1, '2024-04-05', 15.00),
(2, 3, '2024-04-10', 10.50),
(3, 2, '2024-04-12', 20.00),
(4, 5, '2024-04-15', 18.00),
(5, 6, '2024-04-18', 5.00);

CREATE TABLE clima (
    id_clima INT AUTO_INCREMENT PRIMARY KEY,
    id_lote INT NOT NULL,
    campaña VARCHAR(9) NOT NULL,
    temp_promedio DECIMAL(5,2),
    lluvia_total DECIMAL(6,2),
    humedad_promedio DECIMAL(5,2),
    FOREIGN KEY (id_lote) REFERENCES lotes(id_lote)
);

INSERT INTO clima (id_lote, campaña, temp_promedio, lluvia_total, humedad_promedio) VALUES
(1, '2024/2025', 21.8, 460.50, 68.2),
(2, '2024/2025', 22.1, 445.75, 66.0),
(3, '2024/2025', 20.4, 470.00, 70.3),
(4, '2024/2025', 19.9, 495.10, 72.8),
(5, '2024/2025', 21.2, 430.25, 65.5),
(6, '2024/2025', 22.3, 458.00, 67.9),
(7, '2024/2025', 20.7, 483.60, 69.1);
    
CREATE TABLE rendimientos (
    id_rendimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_siembra INT NOT NULL,
    fecha_cosecha DATE,
    toneladas_obtenidas DECIMAL(6,2),
    observaciones TEXT,
    FOREIGN KEY (id_siembra) REFERENCES siembras(id_siembra)
);

INSERT INTO rendimientos (id_siembra, fecha_cosecha, toneladas_obtenidas, observaciones) VALUES
(1, '2024-03-15', 27.50, 'Cosecha con buen rendimiento, clima favorable.'),
(2, '2024-04-10', 19.80, 'Se observaron zonas con estrés hídrico.'),
(3, '2024-02-28', 30.25, 'Excelente rendimiento, suelo bien manejado.'),
(4, '2024-03-22', 21.40, 'Afectado parcialmente por plaga, rendimiento medio.'),
(5, '2024-05-05', 18.90, 'Zona con problemas de drenaje, afectó el volumen.'),
(6, '2024-03-12', 25.60, 'Rendimiento superior al esperado.'),
(7, '2024-04-02', 22.75, 'Clima variable durante el ciclo, pero cosecha estable.');
