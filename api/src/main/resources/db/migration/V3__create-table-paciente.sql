CREATE TABLE pacientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    documentoIdentidad VARCHAR(14) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL,
    urbanizacion VARCHAR(100) NOT NULL,
    distrito VARCHAR(100) NOT NULL,
    codigoPostal VARCHAR(9) NOT NULL,
    complemento VARCHAR(100),
    numero VARCHAR(20),
    provincia VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL
);
