create table if not exists usuario
(
id_usuario SERIAL PRIMARY KEY,
nombre_user VARCHAR(16) NOT NULL,
correo_user CHAR(30) NOT NULL,
clave VARCHAR(8) NOT NULL,
jefe_tienda BOOLEAN NOT NULL,
cliente BOOLEAN NOT NULL,
calle VARCHAR(20),
nro_depto INT,
nro_calle INT,
region VARCHAR(30),
ciudad VARCHAR(30)
);