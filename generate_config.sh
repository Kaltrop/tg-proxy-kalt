#!/bin/bash

# Начинаем формировать config.py
echo "PORT = 443" > config.py
echo "WS_MODE = True" >> config.py

# Если переменная SECRET существует, используем её, иначе — дефолтный ключ
if [ -n "$SECRET" ]; then
  echo "SECRET = '"${SECRET}"'" >> config.py
else
  echo "SECRET = '00000000000000000000000000000000'" >> config.py
fi

# Если переменная TLS_DOMAIN существует, используем её, иначе — дефолтный домен
if [ -n "$TLS_DOMAIN" ]; then
  echo "TLS_DOMAIN = '${TLS_DOMAIN}'" >> config.py
else
  echo "TLS_DOMAIN = 'www.google.com'" >> config.py
fi

echo "Config generated successfully."
