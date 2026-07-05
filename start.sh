#!/bin/bash
# Генерируем config.py
echo "PORT = 443" > config.py
echo "WS_MODE = True" >> config.py
echo "TLS_DOMAIN = 'www.google.com'" >> config.py

# Вставляем секреты для тебя, bro и mom
# Замени ТВОЙ_СЕКРЕТ на твой реальный ключ
echo "SECRET = 'ca23d2994689493d603cc93bf38e3a40 ca23d2994689493d603cc93bf38e3a40\\ngirl ca23d2994689493d603cc93bf38e3a40\\nbro ca23d2994689493d603cc93bf38e3a40\\nmom ca23d2994689493d603cc93bf38e3a40\\nminion ca23d2994689493d603cc93bf38e3a40\\nanonim'" >> config.py

# Запускаем прокси
exec python -u mtprotoproxy.py
