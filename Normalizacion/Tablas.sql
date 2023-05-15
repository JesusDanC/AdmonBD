/*Primer tabla*/

CREATE TABLE Dias (
  ID_registro int PRIMARY KEY,
  Clase_dia varchar(50),
  Periodo varchar(50),
  T_horas int
)

/*Segunda tabla*/
CREATE TABLE Horarios (
  ID_registro int,
  Horario varchar(50),
  FOREIGN KEY (ID_registro) REFERENCES Dias(ID_registro)
)
Tarea Normalizacion
Normalizacion
