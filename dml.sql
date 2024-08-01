
-- Ejecutar el comando COPY dentro de psql

\COPY localidades (codigo_departamento, nombre_departamento, codigo_municipio, nombre_municipio)
FROM '/home/camper/TallerPostgres/localidades .csv' DELIMITER ',' CSV HEADER;

-- Insertar departamentos en la tabla departamento
INSERT INTO departamento (nombre, pais_id)
SELECT DISTINCT nombre_departamento, (SELECT id FROM pais WHERE nombre = 'Colombia')
FROM localidades;

-- Insertar municipios en la tabla municipio
INSERT INTO municipio (nombre, departamento_id)
SELECT DISTINCT l.nombre_municipio, d.id
FROM localidades l
JOIN departamento d ON l.nombre_departamento = d.nombre;
