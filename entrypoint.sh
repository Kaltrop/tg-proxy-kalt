#!/bin/bash

# Записываем порт и режим WebSocket
echo 'PORT = 443' > config.py
echo 'WS_MODE = True' >> config.py

# Если переменная SECRET существует — используем её
if [ -n "$SECRET" ]; then
  echo "SECRET = '${SECRET}'" >> config.py
else
  echo "SECRET = '00000000000000000000000000000000'" >> config.py
fi

# Если переменная TLS_DOMAIN существует — используем её
if [ -n "$TLS_DOMAIN" ]; then
  echo "TLS_DOMAIN = '${TLS_DOMAIN}'" >> config.py
fi

# Запускаем прокси
exec python -u mtprotoproxy.py
