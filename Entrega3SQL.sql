CREATE TABLE IF NOT EXISTS rol (
  id_rol SERIAL PRIMARY KEY,
  administrador BOOLEAN NOT NULL,
  jefe_tienda BOOLEAN NOT NULL,
  cliente BOOLEAN NOT NULL
);	

CREATE TABLE IF NOT EXISTS usuario (
  id_usuario SERIAL PRIMARY KEY,
  nombre_user VARCHAR(30) NOT NULL,
  correo_user VARCHAR(30) NOT NULL,
  clave VARCHAR(8) NOT NULL,
  calle VARCHAR(40),
  nro_depto INT,
  nro_calle INT,
  region VARCHAR(40),
  ciudad VARCHAR(40),
  id_rol INT NOT NULL,
  FOREIGN KEY (id_rol) REFERENCES rol(id_rol)
);

CREATE TABLE IF NOT EXISTS tienda (
	id_tienda SERIAL PRIMARY KEY,
	id_usuario INT NOT NULL,
	nombre_t VARCHAR(40),
	calle VARCHAR(40),
	nro_u INT,
	nro_calle INT,
	region VARCHAR(40),
	ciudad VARCHAR(40),
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE IF NOT EXISTS producto (
  id_producto SERIAL PRIMARY KEY, 
  id_tienda INT NOT NULL,
  precio INT, 
  url_imagen VARCHAR(100),
  stock INT,
  FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda)
);

CREATE TABLE IF NOT EXISTS medio_de_pago (
  id_mp SERIAL PRIMARY KEY,
  credito BOOLEAN NOT NULL,
  debito BOOLEAN NOT NULL,
  transferencia BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS carrito (
  id_carrito SERIAL PRIMARY KEY,
  id_usuario INT NOT NULL,
  estado BOOLEAN NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE IF NOT EXISTS compra (
  id_compra SERIAL PRIMARY KEY,
  id_usuario INT NOT NULL,
  id_carrito INT NOT NULL,
  id_mp INT NOT NULL, 
  id_tienda INT NOT NULL,
  fecha DATE NOT NULL,
  total_compra INT NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (id_carrito) REFERENCES carrito(id_carrito),
  FOREIGN KEY (id_mp) REFERENCES medio_de_pago(id_mp),
  FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda)
);

CREATE TABLE IF NOT EXISTS lista_deseos (
  id_lista SERIAL PRIMARY KEY,
  id_usuario INT NOT NULL,
  total_lista INT,
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE IF NOT EXISTS carta (
	id_carta SERIAL PRIMARY KEY,
	id_producto INT NOT NULL,
	nombre_carta VARCHAR(40),
  descripcion VARCHAR(500),
  año DATE,
	estado VARCHAR(40),
	tipo_carta VARCHAR(40),
	FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE IF NOT EXISTS lista_producto (
	id_lista INT NOT NULL,
	id_producto INT NOT NULL,
  PRIMARY KEY (id_lista, id_producto),
	FOREIGN KEY (id_lista) REFERENCES lista_deseos(id_lista),
	FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE IF NOT EXISTS valoracion (
	id_valoracion SERIAL PRIMARY KEY,
	id_producto INT NOT NULL,
	id_usuario INT NOT NULL,
	comentario VARCHAR(500),
	puntuacion INT,
	valorado BOOLEAN,
	FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE IF NOT EXISTS juego_de_mesa (
  id_juego SERIAL PRIMARY KEY,
  id_producto INT NOT NULL,
  nombre_juego VARCHAR(40),
  descripcion VARCHAR(500),
  tipo_juego VARCHAR(40),
  categoria VARCHAR(40),
  edad_min INT,
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE IF NOT EXISTS carrito_producto (
  id_carrito INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  PRIMARY KEY (id_carrito, id_producto),
  FOREIGN KEY (id_carrito) REFERENCES carrito(id_carrito),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE IF NOT EXISTS compra_producto (
  id_compra INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad_compra INT NOT NULL,
  PRIMARY KEY (id_compra, id_producto),
  FOREIGN KEY (id_compra) REFERENCES compra(id_compra),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);