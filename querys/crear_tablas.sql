CREATE TABLE asentamiento (
    id_asentamiento UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nombre_asent VARCHAR(200),
    tipo_asent VARCHAR(50),
    tipo_vial VARCHAR(50),
    edificio VARCHAR(40),
    numero_int VARCHAR(10)
);

CREATE TABLE ubicacion (
    id_ubicacion UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    codigo_postal VARCHAR(6),
    cve_mun VARCHAR(5),
    cve_loc VARCHAR(8),
    latitud DECIMAL(10,10),
    longitud DECIMAL(10,10),
    id_asentamiento UUID NOT NULL,
    FOREIGN KEY (id_asentamiento) REFERENCES asentamiento(id_asentamiento)
);

CREATE TABLE establecimiento (
    id_establecimiento UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nomb_estab VARCHAR(200),
    raz_social VARCHAR(200),
    codigo_act VARCHAR(8),
    fecha_alta DATE,
    id_ubicacion UUID NOT NULL,
    FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id_ubicacion)
);

CREATE TABLE telefono_establecimiento (
    id_telefono UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id_establecimiento UUID NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    FOREIGN KEY (id_establecimiento) REFERENCES establecimiento(id_establecimiento)
);

CREATE TABLE correo_establecimiento (
    id_correoelec UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id_establecimiento UUID NOT NULL,
    correoelec VARCHAR(85) NOT NULL,
    FOREIGN KEY (id_establecimiento) REFERENCES establecimiento(id_establecimiento)
);

CREATE TABLE www_establecimiento (
    id_www UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id_establecimiento UUID NOT NULL,
    www VARCHAR(45),
    FOREIGN KEY (id_establecimiento) REFERENCES establecimiento(id_establecimiento)
);
