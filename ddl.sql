CREATE DATABASE my_database;

-- Conéctese a la base de datos recién creada
\c my_database;

-- Crear tabla país
CREATE TABLE pais (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Insertar datos en la tabla país (solo un país en este caso)
INSERT INTO pais (nombre) VALUES ('Colombia');

-- Crear tabla departamento
CREATE TABLE departamento (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais_id INT REFERENCES pais(id)
);

-- Crear tabla municipio
CREATE TABLE municipio (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    departamento_id INT REFERENCES departamento(id)
);

CREATE TABLE localidades (
    codigo_departamento INT,
    nombre_departamento VARCHAR(100),
    codigo_municipio INT,
    nombre_municipio VARCHAR(100)
);

