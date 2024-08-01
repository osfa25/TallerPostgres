# TallerPostgres

-- 1. Crear una base de datos:
CREATE DATABASE my_database;

-- Conéctese a la base de datos recién creada:
\c my_database;

-- 2. Crear las tablas de:  (país, departamento y municipio)
CREATE TABLE pais (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

INSERT INTO pais (nombre) VALUES ('Colombia');

CREATE TABLE departamento (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais_id INT REFERENCES pais(id)
);

CREATE TABLE municipio (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    departamento_id INT REFERENCES departamento(id)
);

-- 4. Crear una tabla llamada localidades e ingresar los datos suministrados en el documento de Excel:

CREATE TABLE localidades (
    codigo_departamento INT,
    nombre_departamento VARCHAR(100),
    codigo_municipio INT,
    nombre_municipio VARCHAR(100)
);

-- 5. Poblar los departamentos y municipios usando como fuente de información la tabla de localidades:

INSERT INTO departamento (nombre, pais_id)
SELECT DISTINCT nombre_departamento, (SELECT id FROM pais WHERE nombre = 'Colombia')
FROM localidades;

INSERT INTO municipio (nombre, departamento_id)
SELECT DISTINCT l.nombre_municipio, d.id
FROM localidades l
JOIN departamento d ON l.nombre_departamento = d.nombre;
