USE inegi_oziel;
LOAD DATA INFILE '/var/lib/mysql-files/asentamiento_reducido.csv'
INTO TABLE asentamiento
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'  
LINES TERMINATED BY '\n'  
IGNORE 1 LINES  
(id_asentamiento, nombre_asent, tipo_asent, tipo_vial, edificio, numero_int);
