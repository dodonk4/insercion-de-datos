CREATE SCHEMA `technology_store_2`;


USE technology_store_2;

CREATE TABLE admins(
	admin_id INT NOT NULL AUTO_INCREMENT,
    admin_name VARCHAR(60) NOT NULL,
    admin_pass VARCHAR(30) NOT NULL,
    PRIMARY KEY (admin_id)
);


CREATE TABLE places(
	place_id INT NOT NULL AUTO_INCREMENT,
    place_name VARCHAR(30) NOT NULL,
    emp_id INT NOT NULL,
    PRIMARY KEY (place_id)
);



CREATE TABLE distributors(
	distr_id INT NOT NULL AUTO_INCREMENT,
	distr_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (distr_id)
);



CREATE TABLE products(
	prod_id INT NOT NULL AUTO_INCREMENT,
	prod_name VARCHAR(30) NOT NULL,
    prod_type VARCHAR(30) NOT NULL,
    prod_price DECIMAL NOT NULL,
    prod_stock INT NOT NULL,
    distr_id INT NOT NULL,
    PRIMARY KEY (prod_id)
);



CREATE TABLE movements(
	mov_id INT NOT NULL AUTO_INCREMENT,
    mov_type VARCHAR(30) NOT NULL,
    mov_quantity INT NOT NULL,
    mov_price DECIMAL NOT NULL,
    place_id INT NOT NULL,
    prod_id INT NOT NULL,
    emp_id INT NOT NULL,
    PRIMARY KEY (mov_id)
);


CREATE TABLE employees(
	emp_id INT NOT NULL AUTO_INCREMENT,
    emp_name VARCHAR(30) NOT NULL,
    emp_pass VARCHAR(30) NOT NULL,
    PRIMARY KEY (emp_id)
);

INSERT INTO admins (admin_name, admin_pass) values
('Gustavo', 'gustav0'),
('Alejandra', 'alejandr4'),
('Cintia', 'cinti4');

INSERT INTO places (place_name, emp_id) values
('Palermo', 1),
('Centro', 2),
('Avellaneda', 3);

INSERT INTO distributors (distr_name) values
('El Gaucho'),
('Don Carlos'),
('Serranita');

INSERT INTO products (prod_name, prod_type, prod_price, prod_stock, distr_id) values
('TwinTouch', 'Auricular', 7000, 20, 1),
('Ikonic', 'Parlante', 3500, 5, 1),
('PlayStation 5', 'Consola', 350000, 2, 2),
('i12', 'Auricular', 5000, 5, 2),
('Cable Samsung', 'cable Tipo-C', 850, 70, 3),
('Megalite LAN 3 Mts', 'Cable LAN', 800, 15, 3),
('Megalite HDMI 1Mts', 'Cable HDMI', 700, 13, 3),
('Sentey Strong Glass', 'Gabinete', 20000, 1, 3),
('NVIDIA GTX 1080ti', 'Tarjeta de vídeo', 60000, 4, 2);

INSERT INTO movements (mov_type, mov_quantity, mov_price, place_id, prod_id, emp_id) values
('Egreso', 1, -3500, 3, 2, 1),
('Ingreso', -1, 7000, 1, 1, 1),
('Ingreso', -1, 7000, 1, 2, 2),
('Ingreso', -1, 350000, 1, 3, 1),
('Ingreso', -2, 10000, 1, 4, 3),
('Ingreso', -1, 7000, 3, 1, 3),
('Egreso', 1, -850, 3, 5, 2),
('Ingreso de Producto', 2, 0, 2, 1, 2),
('Ingreso', 1, 20000, 2, 8, 1),
('Ingreso de Producto', 1, 0, 3, 9, 3);

SET FOREIGN_KEY_CHECKS=0; 
/*
Esto es para permitirme insertar datos en las Foreign Keys
Me saltaba error 1452 sino
 */

ALTER TABLE places ADD CONSTRAINT adding_forkey_0
FOREIGN KEY (emp_id) REFERENCES employees(emp_id) ON UPDATE CASCADE;

ALTER TABLE movements ADD CONSTRAINT adding_forkey_mov_0 
FOREIGN KEY (place_id) REFERENCES places(place_id) ON UPDATE CASCADE ;

ALTER TABLE movements ADD CONSTRAINT adding_forkey_mov_1 
FOREIGN KEY (prod_id) REFERENCES products(prod_id) ON UPDATE CASCADE ;

ALTER TABLE movements ADD CONSTRAINT adding_forkey_mov_2 
FOREIGN KEY (emp_id) REFERENCES employees(emp_id) ON UPDATE CASCADE ;

ALTER TABLE products ADD CONSTRAINT adding_forkey_prod_0 
FOREIGN KEY (distr_id) REFERENCES distributors(distr_id) ON UPDATE CASCADE ;

