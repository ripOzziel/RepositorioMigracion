USE inegi_oziel;
LOAD DATA INFILE '/var/lib/mysql-files/telefono_reducido.csv'
INTO TABLE telefono_establecimiento
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'  
LINES TERMINATED BY '\n'  
IGNORE 1 LINES  
(id_telefono, id_establecimiento, telefono);
