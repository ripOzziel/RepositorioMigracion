USE inegi_oziel;
LOAD DATA INFILE '/var/lib/mysql-files/establecimiento_reducido.csv'
INTO TABLE establecimiento
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'  -
LINES TERMINATED BY '\n'  
IGNORE 1 LINES  
(id_establecimiento, nomb_estab, raz_social, codigo_act, fecha_alta, id_ubicacion);
