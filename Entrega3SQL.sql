CREATE TABLE IF NOT EXISTS usuario (
  id_usuario SERIAL PRIMARY KEY,
  nombre_user VARCHAR(16) NOT NULL,
  correo_user VARCHAR(30) NOT NULL,
  clave VARCHAR(8) NOT NULL,
  jefe_tienda BOOLEAN NOT NULL,
  cliente BOOLEAN NOT NULL,
  calle VARCHAR(20),
  nro_depto INT,
  nro_calle INT,
  region VARCHAR(30),
  ciudad VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS producto (
  id_producto SERIAL PRIMARY KEY, 
  nombre_producto VARCHAR(30),
  precio INT, 
  url_imagen VARCHAR(100),
  descripcion VARCHAR(500),
  juegos_mesa BOOLEAN, 
  juegos_carta BOOLEAN, 
  stock INT
);

CREATE TABLE IF NOT EXISTS lista_deseos (
  id_lista SERIAL PRIMARY KEY,
  id_usuario SERIAL NOT NULL,
  id_producto SERIAL NOT NULL,
  total_lista INT,
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE IF NOT EXISTS tienda (
  id_tienda SERIAL PRIMARY KEY,
  id_usuario SERIAL NOT NULL,
  nombre_t VARCHAR(30),
  calle VARCHAR(20),
  nro_u INT,
  nro_calle INT,
  region VARCHAR(30),
  ciudad VARCHAR(30),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE IF NOT EXISTS juego_de_mesa (
  id_juego SERIAL PRIMARY KEY,
  id_producto SERIAL NOT NULL,
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
);
