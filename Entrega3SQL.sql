CREATE TABLE IF NOT EXISTS rol (
  id_rol SERIAL PRIMARY KEY,
  administrador BOOLEAN NOT NULL,
  jefe_tienda BOOLEAN NOT NULL,
  cliente BOOLEAN NOT NULL
);	

CREATE TABLE IF NOT EXISTS usuario (
  id_usuario SERIAL PRIMARY KEY,
  nombre_user VARCHAR(16) NOT NULL,
  correo_user VARCHAR(30) NOT NULL,
  clave VARCHAR(8) NOT NULL,
  calle VARCHAR(20),
  nro_depto INT,
  nro_calle INT,
  region VARCHAR(30),
  ciudad VARCHAR(30),
  id_rol int NOT NULL,
  FOREIGN KEY (id_rol) REFERENCES rol(id_rol)
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

CREATE TABLE IF NOT EXISTS medio_de_pago(
  id_mp SERIAL PRIMARY KEY,
  credito BOOLEAN NOT NULL,
  debito BOOLEAN NOT NULL,
  transferencia BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS carrito(
  id_carrito SERIAL PRIMARY KEY,
  id_usuario int NOT NULL,
  estado BOOLEAN NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE IF NOT EXISTS tienda (
	id_tienda SERIAL PRIMARY KEY,
	id_usuario int NOT NULL,
	nombre_t VARCHAR(30),
	calle VARCHAR(20),
	nro_u INT,
	nro_calle INT,
	region VARCHAR(30),
	ciudad VARCHAR(30),
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE IF NOT EXISTS compra(
  id_compra SERIAL PRIMARY KEY,
  id_usuario int NOT NULL,
  id_carrito int NOT NULL,
  id_mp int NOT NULL, 
  id_tienda int NOT NULL,
  fecha DATE NOT NULL,
  total_compra INT NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (id_carrito) REFERENCES carrito(id_carrito),
  FOREIGN KEY (id_mp) REFERENCES medio_de_pago(id_mp),
  FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda)
);

CREATE TABLE IF NOT EXISTS lista_deseos (
  id_lista SERIAL PRIMARY KEY,
  id_usuario int NOT NULL,
  id_producto int NOT NULL,
  total_lista INT,
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE IF NOT EXISTS carta (
	id_carta SERIAL PRIMARY KEY,
	id_producto int NOT NULL,
	año DATE,
	estado VARCHAR(30),
	tipo_carta VARCHAR(30),
	FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE IF NOT EXISTS lista_producto (
	id_lista_producto SERIAL PRIMARY KEY,
	id_lista int NOT NULL,
	id_producto int NOT NULL,
	FOREIGN KEY (id_lista) REFERENCES lista_deseos(id_lista),
	FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE IF NOT EXISTS valoracion (
	id_valoracion SERIAL PRIMARY KEY,
	id_producto int NOT NULL,
	id_usuario int NOT NULL,
	comentario VARCHAR(500),
	puntuacion int,
	valorado BOOLEAN,
	FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE IF NOT EXISTS ventas (
	id_ventas SERIAL PRIMARY KEY,
	id_compra int NOT NULL,
	id_tienda int NOT NULL,   
	FOREIGN KEY (id_compra) REFERENCES compra(id_compra),
	FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda)
);

CREATE TABLE IF NOT EXISTS venta_tienda (
	id_venta_tienda SERIAL PRIMARY KEY,
	id_ventas int NOT NULL,
	id_tienda int NOT NULL,   
	FOREIGN KEY (id_ventas) REFERENCES ventas(id_ventas),
	FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda)
);

CREATE TABLE IF NOT EXISTS juego_de_mesa (
  id_juego SERIAL PRIMARY KEY,
  id_producto int NOT NULL,
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE IF NOT EXISTS carrito_producto(
  id_carrito_producto SERIAL PRIMARY KEY,
  id_carrito int NOT NULL,
  id_producto int NOT NULL,
  cantidad INT NOT NULL,
  FOREIGN KEY (id_carrito) REFERENCES carrito(id_carrito),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE IF NOT EXISTS compra_producto(
  id_compra_producto SERIAL PRIMARY KEY,
  id_compra int NOT NULL,
  id_producto int NOT NULL,
  cantidad_compra INT NOT NULL,
  FOREIGN KEY (id_compra) REFERENCES compra(id_compra),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);