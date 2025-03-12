import pandas as pd
import uuid

# Cargar el archivo Excel (todas las hojas en un diccionario)
df = pd.read_excel("normalizado.xlsx", sheet_name=None)

# Seleccionar la hoja de teléfono_establecimiento
df_telefono = df['telefono_establecimiento']

# Eliminar filas donde 'telefono' sea NaN, vacío o solo espacios en blanco
df_telefono = df_telefono.dropna(subset=["telefono"])  # Eliminar NaN
df_telefono = df_telefono[df_telefono["telefono"].astype(str).str.strip() != ""]  # Eliminar vacíos

# Convertir teléfono a string y quitar decimales .0
df_telefono["telefono"] = df_telefono["telefono"].astype(int)

# Agregar un identificador único a cada fila
df_telefono["id_telefono"] = [uuid.uuid4() for _ in range(len(df_telefono))]

# Guardar el archivo limpio en CSV
df_telefono.to_csv("telefono_establecimiento_limpio.csv", index=False)

print("Se eliminaron las filas sin teléfono y se guardó en 'telefono_establecimiento_limpio.csv' sin .0 en los números.")
