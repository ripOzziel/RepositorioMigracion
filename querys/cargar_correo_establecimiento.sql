USE inegi_oziel;
LOAD DATA INFILE '/var/lib/mysql-files/correo_reducido.csv'
INTO TABLE correo_establecimiento
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'  
LINES TERMINATED BY '\n'  
IGNORE 1 LINES  
(id_correoelec, id_establecimiento, correoelec);
