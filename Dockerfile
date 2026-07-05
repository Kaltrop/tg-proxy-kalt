FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git openssl && \
    git clone https://github.com/alexbers/mtprotoproxy.git && \
    cd mtprotoproxy && \
    pip install --no-cache-dir cryptg

WORKDIR /app/mtprotoproxy

EXPOSE 443

# Запускаем прокси, передавая секреты прямо в команде через переменные окружения
CMD python -c "import os; s = os.environ.get('SECRET', ''); t = os.environ.get('TLS_DOMAIN', 'www.google.com'); print(f'PORT = 443\nWS_MODE = True\nTLS_DOMAIN = \"{t}\"\nSECRET = \"{s}\"')" > config.py && exec python -u mtprotoproxy.py
