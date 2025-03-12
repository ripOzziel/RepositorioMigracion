# RepsositorioMigracion
Normalizacion y migracion de datos de inegi a base de datos SQL.
# Migracion de base de datos

En este repositorio se muestra de migracion de una base de datos en una hoja de calculo a una base de datos en MySQL.

### Descripcion
El archivo original sacado de la pagina oficial de [INEGI](https://www.inegi.org.mx/ "INEGI"), es una hoja de calculo de DENUE.

Esta hoja de calculo contiene columnas que hacen referencia a lo siguiente:

| Columna        | Descripción                                                                 |
|----------------|-----------------------------------------------------------------------------|
| **id**         | Identificador único de la unidad económica.                                 |
| **nom_estab**  | Nombre del establecimiento o negocio.                                       |
| **raz_social** | Razón social (nombre legal de la empresa).                                  |
| **codigo_act** | Código de actividad económica (clasificación del giro del negocio).         |
| **tipo_vial**  | Tipo de vía (calle, avenida, boulevard, etc.).                              |
| **numero_ext** | Número exterior de la dirección.                                            |
| **edificio**   | Nombre o referencia del edificio (si aplica).                               |
| **edificio_e** | Piso o nivel del edificio (si aplica).                                      |
| **numero_int** | Número interior o departamento (si aplica).                                 |
| **tipo_asent** | Tipo de asentamiento (colonia, barrio, fraccionamiento, etc.).              |
| **nomb_asent** | Nombre del asentamiento (colonia, barrio, etc.).                            |
| **cod_postal** | Código postal de la ubicación.                                              |
| **cve_mun**    | Clave del municipio (identificador único del municipio).                    |
| **cve_loc**    | Clave de la localidad (identificador único de la localidad).                |
| **telefono**   | Número de teléfono del establecimiento.                                     |
| **correoelec** | Dirección de correo electrónico del establecimiento.                        |
| **www**        | Sitio web del establecimiento (si tiene).                                   |
| **contactos**  | Cantidad de contactos que tiene la empresa.|
| **latitud**    | Coordenada geográfica de latitud.                                           |
| **longitud**   | Coordenada geográfica de longitud.                                          |
| **fecha_alta** | Fecha de alta o registro del establecimiento en la base de datos.           |

## Requisitos
### Software
- Editor de hojas de calculo (Ecxel, Libre Office, Google Sheets, etc.).
- MySQL
- Python 3

### Librerias utilizadas
- Pandas
- UID

## Preparacion de datos
Se crearon tablas en base al siguiente diagrama y se exportaron individualmente como archivos .csv:
![](/img/diagramaER.png)

## Proceso de importacion
Primero se creo la base de datos inegi_oziel, en el cual se ejecuto el script de [crear tablas](/querys/crear_tablas.sql "crear tablas") para su posterior relleno.

Se hacen en el orden en el que estan escritas para no generar errores con las foreign keys.

Se utilizo un **script en SQL** personalizado para cada tabla de la base de datos **inegi_oziel** para cargar datos desde un archivo **CSV**. El proceso se realizo mediante la sentencia **LOAD DATA INFILE** , que permite importar datos de manera eficiente desde un archivo externo a una tabla de MySQL.
Dichos scripts se encuentran dentro de la carpeta de querys.

#### Script
    USE inegi_oziel;
    LOAD DATA INFILE 'ruta_hacia_archivo.csv'
    INTO TABLE tabla_destino
    FIELDS TERMINATED BY ',' 
    ENCLOSED BY '"'  
    LINES TERMINATED BY '\n'  
    IGNORE 1 LINES  -- para ignorar el encabezado
    (columnas de la tabla_destino);
    

### Pasos para la importacion
1.  Crear la base de datos destino.
2. Crear tablas dentro de la base de datos destino.
3. Ejecutar el script correspondiente a cada tabla.

## Problemas y soluciones
#### Asignacion de UUID
Para la asignacion de UUID's para cada tabla principal **(Establecimiento, Asentamiento y Ubicacion)** se utilizo el script de python [clean_csv](/scripts_python/clean_csv.py "clean_csv").
Una vez asignados los **UUID**'s de cada tabla, se copia la columna completa de cada **Pk** que sea **Fk** en otra tabla (dentro de la hoja de calculo).

#### Eliminacion de es espacios vacios
En las tablas de contactos de los establecimientos **(www, coreoelec y telefono)**, habia multiples espacios vacios, asi que usaremos los scripts de personalizados para cada caso que encuentas en la carpeta de [scripts_python](/scripts_python "scripts_python"), el cual borrara espacios vacios y agregara un UUID a cada registro de cada tabla

#### Ruta para cargar archivos
En MySQL viene por defecto una carpeta de donde puedes cargar los archivos con el comando **LOAD DATA INFILE**, para conocerla debemos de ingresar el comando:
 ``` SHOW VARIABLES LIKE 'secure_file_priv';```

Tendras que copiar o mover tus archivos CSV a esa carpeta.

## Conclusión y Notas Finales

La migración de la base de datos permitió estructurar mejor la información, reduciendo redundancias y optimizando consultas. Se automatizó la limpieza y transformación de datos mediante **Python y SQL**, asegurando la integridad de las relaciones y mejorando la escalabilidad con el uso de **UUIDs**.  

### Notas Finales
- Verificar la integridad de los datos después de la importación.  
- Considerar una estrategia **ETL** si los datos se actualizan con frecuencia.  
- Optimizar consultas agregando índices en columnas clave según sea necesario.  



