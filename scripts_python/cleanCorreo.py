import pandas as pd
import uuid

# Cargar el archivo Excel (todas las hojas en un diccionario)
df = pd.read_excel("normalizado.xlsx", sheet_name=None)

# Seleccionar la hoja de teléfono_establecimiento
df_correo = df['correo_establecimiento']

# Eliminar filas donde 'telefono' sea NaN, vacío o solo espacios en blanco
df_correo = df_correo[df_correo["correoelec"].astype(str).str.strip() != ""]  # Eliminar vacíos
df_correo = df_correo.dropna(subset=["correoelec"])  # Eliminar NaN

# Convertir teléfono a string y quitar decimales .0
df_correo["correoelec"] = df_correo["correoelec"].astype(str)

# Agregar un identificador único a cada fila
df_correo["id_correoelec"] = [uuid.uuid4() for _ in range(len(df_correo))]

# Guardar el archivo limpio en CSV
df_correo.to_csv("correo_establecimiento_limpio.csv", index=False)

print("Se eliminaron las filas sin correo y se guardó en 'correo_establecimiento_limpio.csv'.")
