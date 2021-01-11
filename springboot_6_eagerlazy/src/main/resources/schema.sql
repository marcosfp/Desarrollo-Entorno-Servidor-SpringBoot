use springboot_security;

--alter table PROFESOR_MODULO drop foreign key FK_PROFESOR_MODULO_1;
--alter table PROFESOR_MODULO drop foreign key FK_PROFESOR_MODULO_2;

--drop table if exists PROFESOR_MODULO;
--drop table if exists IMAGEN;
--drop table if exists MODULO;
--drop table if exists EMAIL;
--drop table if exists PROFESOR;

drop database if exists springboot_security;
create database springboot_security;

use springboot_security;

CREATE TABLE PROFESOR
(
   ID_PROFESOR INT NOT NULL AUTO_INCREMENT,
   NOMBRE VARCHAR (40) NOT NULL,
   PASSWORD VARCHAR (120) NOT NULL,
   NICKNAME VARCHAR (40) NOT NULL,
   APELLIDOS VARCHAR (40) NOT NULL,
   PRIMARY KEY (ID_PROFESOR)
);

CREATE TABLE IMAGEN
(
   ID_IMAGEN INT NOT NULL AUTO_INCREMENT,
   NOMBRE VARCHAR (40) NOT NULL,
   IMAGEN LONGBLOB NOT NULL,
   ID_PROFESOR INT NOT NULL,
   PRIMARY KEY (ID_IMAGEN),
   CONSTRAINT FK_IMAGEN_PROFESOR FOREIGN KEY (ID_PROFESOR) REFERENCES PROFESOR (ID_PROFESOR) ON UPDATE CASCADE 
   
);

CREATE TABLE ROL
(
   ID_ROL INT AUTO_INCREMENT,
   NOMBRE_ROL VARCHAR (40) NOT NULL,
   PRIMARY KEY (ID_ROL)
);

CREATE TABLE PROFESOR_ROL
(
   ID_PROFESOR INT NOT NULL,
   ID_ROL INT,
      PRIMARY KEY
   (
      ID_PROFESOR,
      ID_ROL
   ),
   CONSTRAINT FK_PROFESOR_ROL_1 FOREIGN KEY (ID_PROFESOR) REFERENCES PROFESOR (ID_PROFESOR) ON DELETE CASCADE,
   CONSTRAINT FK_PROFESOR_ROL_2 FOREIGN KEY (ID_ROL) REFERENCES ROL (ID_ROL)
);

CREATE TABLE EMAIL
(
   ID_EMAIL INT NOT NULL AUTO_INCREMENT,
   DIRECCION_EMAIL VARCHAR (40) NOT NULL UNIQUE,
   ID_PROFESOR INT NOT NULL,
   PRIMARY KEY (ID_EMAIL),
   CONSTRAINT FK_EMAIL_PROFESOR FOREIGN KEY (ID_PROFESOR) REFERENCES PROFESOR (ID_PROFESOR) ON UPDATE CASCADE 
);

CREATE TABLE MODULO
(
   ID_MODULO INT NOT NULL AUTO_INCREMENT,
   NOMBRE_MODULO VARCHAR (40) NOT NULL UNIQUE,
   PRIMARY KEY (ID_MODULO)
);

CREATE TABLE PROFESOR_MODULO
(
   ID_PROFESOR INT NOT NULL,
   ID_MODULO INT NOT NULL,
   PRIMARY KEY
   (
      ID_PROFESOR,
      ID_MODULO
   ),
   CONSTRAINT FK_PROFESOR_MODULO_1 FOREIGN KEY (ID_PROFESOR) REFERENCES PROFESOR (ID_PROFESOR) ON DELETE CASCADE,
   CONSTRAINT FK_PROFESOR_MODULO_2 FOREIGN KEY (ID_MODULO) REFERENCES MODULO (ID_MODULO)
);