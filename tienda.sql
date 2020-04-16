CREATE DATABASE tienda_de_ropa CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE tienda_de_ropa;

CREATE TABLE estados(
	idEstado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	estado INT NOT NULL,
	descripcion VARCHAR(255)

);

INSERT INTO estados (estado, descripcion) VALUES (1, 'Activo'),(0, 'inactivo');

/*
	1 -> Activo
	0 -> Inactivo
*/

CREATE TABLE productos (
	idProducto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idEstado INT NOT NULL,
	idCategoria INT NOT NULL,
	nombreProducto VARCHAR(255),
	precio DECIMAL(10,2),
	imgProducto VARCHAR(255)

);

INSERT INTO productos (idEstado, idCategoria, nombreProducto, precio, imgProducto) VALUES (1,1,'Botas Brahma',334900,'https://www.brahma.co/images/7468/fit-w-960');
INSERT INTO productos (idEstado, idCategoria, nombreProducto, precio, imgProducto) VALUES (1,2,'Mocasines Basement', 129990, 'https://falabella.scene7.com/is/image/FalabellaCO/3637568_1?wid=1500&hei=1500&qlt=70');
INSERT INTO productos (idEstado, idCategoria, nombreProducto, precio, imgProducto) VALUES (1,3,'Tenis Converse', 189990, 'https://www.converse.com/dw/image/v2/BCZC_PRD/on/demandware.static/-/Sites-cnv-master-catalog/default/dw8a027dc6/images/a_107/567994C_A_107X1.jpg?sw=964');

CREATE TABLE categoria (
	idCategoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idEstado INT NOT NULL,
	idSubcategoria INT NOT NULL,
	categoria VARCHAR(255)

);

/*
	1 ->	Botas
	2 ->	Mocasines
	3 -> 	Tenis

	Categorias
*/
 

INSERT INTO categoria (idEstado,idSubcategoria,categoria) VALUES (1,1,'Botas'), (1,2,'Mocasines'), (1,3,'Botas');


CREATE TABLE subcategoria (
	idSubcategoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idEstado INT NOT NULL,
	descripcion VARCHAR(255)
	
);

/*
	1 ->	Cuero
	2 -> 	gamuza
	3 ->	tela

	subcategorias
*/

INSERT INTO subcategoria (idEstado,descripcion) VALUES (1,'Material: Cuero'), (1,'Material: Gamuza'), (1,'Material:Tela');


CREATE TABLE usuarios (
	idUsuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idRol INT NOT NULL,
	idEstado INT NOT NULL,
	nombre VARCHAR(255),
	apellido VARCHAR(255),
	correo VARCHAR(255),
	contrasenia VARCHAR(255)

);
INSERT INTO usuarios (idRol, idEstado, nombre, apellido, correo, contrasenia) VALUES (1,1,'Daniel','Sanchez','daniel@correo.com','12345'), (2,1,'Pepe','Pepito','pepe@correo.com','54321');

CREATE TABLE roles(
	idRol INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idEstado INT NOT NULL,
	rol INT NOT NULL

);

INSERT INTO roles (idEstado, rol) VALUES (1,1), (1,2);

/*
	1 -> SuperAdmin
	2 -> Admin	

*/

ALTER TABLE usuarios ADD CONSTRAINT fk_rol FOREIGN KEY (idRol) REFERENCES roles(idRol) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE usuarios ADD CONSTRAINT fk_estado FOREIGN KEY (idEstado) REFERENCES estados(idEstado) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE productos ADD CONSTRAINT fk_categoria FOREIGN KEY (idCategoria) REFERENCES categoria(idCategoria) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE productos ADD CONSTRAINT fk_estado_producto FOREIGN KEY (idEstado) REFERENCES estados(idEstado) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE categoria ADD CONSTRAINT fk_subcategoria FOREIGN KEY (idSubcategoria) REFERENCES subcategoria(idSubcategoria) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE categoria ADD CONSTRAINT fk_estado_categoria FOREIGN KEY (idEstado) REFERENCES estados(idEstado) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE subcategoria ADD CONSTRAINT fk_estado_subcategoria FOREIGN KEY (idEstado) REFERENCES estados(idEstado) ON DELETE CASCADE ON UPDATE CASCADE;




