import pandas as pd
import uuid

df = pd.read_excel("normalizado.xlsx", sheet_name=None)  # Cargar el Excel
#df_establecimiento = df['establecimiento']
df_ubicacion = df['ubicacion']
#df_asentamiento = df['asentamiento']

# Generar UUIDs únicos para establecimientos, ubicaciones y asentamientos
#df_establecimiento["id_establecimiento"] = [uuid.uuid4() for _ in range(len(df_establecimiento))]
df_ubicacion["id_ubicacion"] = [uuid.uuid4() for _ in range(len(df_ubicacion))]
#df_asentamiento["id_asentamiento"] = [uuid.uuid4() for _ in range(len(df_asentamiento))]

# Reemplazar valores vacíos con NULLs
#df_establecimiento = df_establecimiento.where(pd.notnull(df_establecimiento), None)
#df_ubicacion = df_ubicacion.where(pd.notnull(df_ubicacion), None)
#df_asentamiento = df_asentamiento.where(pd.notnull(df_asentamiento), None)

# Guardar como CSV limpio para cada DataFrame
#df_establecimiento.to_csv("establecimiento_limpio.csv", index=False)
df_ubicacion.to_csv("ubicacion_limpia.csv", index=False)
#df_asentamiento.to_csv("asentamiento_limpio.csv", index=False)
