import pandas as pd
import uuid

# Cargar el archivo Excel (todas las hojas en un diccionario)
df = pd.read_excel("normalizado.xlsx", sheet_name=None)

# Seleccionar la hoja de teléfono_establecimiento
df_www = df['www_establecimiento']

# Eliminar filas donde 'www' sea NaN, vacío o solo espacios en blanco
df_www = df_www[df_www["www"].astype(str).str.strip() != ""]  # Eliminar vacíos
df_www = df_www.dropna(subset=["www"])  # Eliminar NaN


df_www["www"] = df_www["www"].astype(str)

# Agregar un identificador único a cada fila
df_www["id_www"] = [uuid.uuid4() for _ in range(len(df_www))]

# Guardar el archivo limpio en CSV
df_www.to_csv("www_establecimiento_limpio.csv", index=False)

print("Se eliminaron las filas sin correo y se guardó en 'www_establecimiento_limpio.csv'.")
