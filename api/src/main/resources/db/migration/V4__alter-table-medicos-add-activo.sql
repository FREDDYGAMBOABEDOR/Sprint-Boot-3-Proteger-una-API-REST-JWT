-- Agregar columna "activo" a la tabla "medicos"
ALTER TABLE medicos ADD COLUMN activo boolean;

-- Establecer el valor de "activo" en 1 para todos los registros
UPDATE medicos SET activo = true;
