CREATE DATABASE GLOBAL;

USE GLOBAL;

CREATE TABLE T_usuario
(

ID_usuario INT NOT NULL PRIMARY KEY ,
Nombre NVARCHAR(30),
Apellido NVARCHAR(30),
Clave INT,
Sexo NVARCHAR(1),
CONSTRAINT CHK_Sexo CHECK (Sexo='M' OR Sexo='F'),
Rol NVARCHAR(30), 
Fecha_registro DATETIME, 
Fecha_acceso DATETIME, 
B_activo NVARCHAR(1),
CONSTRAINT CHK_B_activo CHECK (B_activo='T' OR B_activo='F')

);




CREATE TABLE T_CALIFICACIONES 
(

ID_calif INT PRIMARY KEY ,
ID_alumno INT NOT NULL, 
ID_maestro INT, 
Calificaciones INT, 
B_Final VARCHAR(5), 
CONSTRAINT CHK_B_Final CHECK (B_Final='T' OR B_Final='F'),
Fecha_Final DATE NULL, 
FOREIGN KEY (ID_alumno) REFERENCES T_usuario(ID_usuario),
FOREIGN KEY (ID_maestro) REFERENCES T_usuario(ID_usuario) 

);


CREATE TABLE TH_acceso (
I_seq INT PRIMARY KEY, 
ID_usuario INT, 
Fecha_acceso DATETIME, 
FOREIGN KEY (ID_usuario) REFERENCES T_usuario(ID_usuario));


CREATE TABLE TH_clave (
I_seq INT PRIMARY KEY, 
ID_usuario INT, 
Clave_ant INT, 
Fecha DATETIME, 
FOREIGN KEY (ID_usuario) REFERENCES T_usuario(ID_usuario));


select clave from T_usuario where ID_usuario='193440920';
update T_usuario set Clave=12345 where ID_usuario='193440920';

Insert into T_usuario values (193440920, 'Alfredo', 'Lopez', 1234, 'M', 'MAESTRO', '01/05/2016', null, 'T');
Insert into T_usuario values (593440121, 'Martha', 'Romero', 1234, 'F', 'ALUMNO', '01/05/2016', null, 'T');
Insert into T_usuario values (593440122, 'Juan', 'Infante', 1234, 'M', 'ALUMNO', '01/05/2016', null, 'T');
Insert into T_usuario values (593440123, 'María', 'Zamora', 1234, 'F', 'ALUMNO', '01/05/2016', null, 'T');
Insert into T_usuario values (593440124, 'Diana', 'Reyes', 1234, 'F', 'ALUMNO', '01/05/2016', null, 'T');
Insert into T_usuario values (193440921, 'Luis', 'Pasteur', 1234, 'M', 'ADMIN', '01/05/2016', null, 'T');
Insert into T_usuario values (193440930, 'Cecilia', 'Arana', 1234, 'F', 'MAESTRO', '01/05/2016', null, 'T');


INSERT INTO T_CALIFICACIONES (ID_Calif, ID_alumno,ID_maestro,Calificaciones,B_Final) VALUES (0,593440121,193440920, 100, 'F');
INSERT INTO T_CALIFICACIONES (ID_Calif,ID_alumno,ID_maestro,Calificaciones,B_Final) VALUES (1,593440122,193440920, 50, 'F');
INSERT INTO T_CALIFICACIONES (ID_Calif,ID_alumno,ID_maestro,Calificaciones,B_Final) VALUES (2,593440123,193440930, 100, 'F');
INSERT INTO T_CALIFICACIONES (ID_Calif,ID_alumno,ID_maestro,Calificaciones,B_Final) VALUES (3,593440123,193440920, 70, 'F');

insert into TH_clave (I_seq,ID_usuario, Clave_ant, Fecha) values(0,193440921,123456,'12/05/2018');
insert into TH_acceso (I_seq,ID_usuario, Fecha_acceso) values(0,193440921,'12/05/2018');
