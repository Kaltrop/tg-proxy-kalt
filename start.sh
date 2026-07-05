#!/bin/bash
# Генерируем config.py
echo "PORT = 443" > config.py
echo "WS_MODE = True" >> config.py
echo "TLS_DOMAIN = 'www.google.com'" >> config.py

# Вставляем секреты для тебя, bro и mom
# Замени ТВОЙ_СЕКРЕТ на твой реальный ключ
echo "SECRET = 'ТВОЙ_СЕКРЕТ ТВОЙ_СЕКРЕТ\\nbro ТВОЙ_СЕКРЕТ\\nmom'" >> config.py

# Запускаем прокси
exec python -u mtprotoproxy.py
