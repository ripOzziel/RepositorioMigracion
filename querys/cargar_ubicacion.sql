USE inegi_oziel;
LOAD DATA INFILE '/home/ripozziel/dev/ubicacion_reducido.csv'
INTO TABLE ubicacion
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'  
LINES TERMINATED BY '\n'  
IGNORE 1 LINES  
(id_ubicacion, codigo_postal, cve_mun, cve_loc, latitud, longitud, id_asentamiento);
