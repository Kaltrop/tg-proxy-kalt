import os
import sys

# Получаем значения из переменных окружения или задаем дефолтные
secret = os.environ.get("SECRET", "")
tls_domain = os.environ.get("TLS_DOMAIN", "www.google.com")

# Проверяем, что секрет задан
if not secret:
    print("ERROR: SECRET environment variable is required.")
    sys.exit(1)

# Генерируем config.py
with open("/app/mtprotoproxy/config.py", "w") as f:
    f.write(f'PORT = 443\n')
    f.write(f'WS_MODE = True\n')
    f.write(f'TLS_DOMAIN = "{tls_domain}"\n')
    f.write(f'SECRET = "{secret}"\n')

print("Config patched successfully with SECRET from environment.")
