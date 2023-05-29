create table usuarios (
    id BIGSERIAL PRIMARY KEY,
    login varchar(100) NOT NULL,
    clave varchar(300) NOT NULL
);