USE inegi_oziel;
LOAD DATA INFILE '/var/lib/mysql-files/www_reducido.csv'
INTO TABLE www_establecimiento
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'  
LINES TERMINATED BY '\n'  
IGNORE 1 LINES  
(id_www, id_establecimiento, www);
