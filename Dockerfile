FROM python:3.11-slim

WORKDIR /app

# Обновляем пакеты и устанавливаем зависимости
RUN apt-get update && apt-get install -y git openssl && \
    git clone https://github.com/alexbers/mtprotoproxy.git && \
    cd mtprotoproxy && \
    pip install --no-cache-dir cryptography cryptg

WORKDIR /app/mtprotoproxy

# Генерируем файл конфигурации с НАСТОЯЩИМИ секретами из переменной окружения SECRET,
# которую мы зададим в Render
RUN echo 'import os' > config.py && \
    echo 'PORT = int(os.environ.get("PORT", 443))' >> config.py && \
    echo 'TLS_DOMAIN = os.environ.get("TLS_DOMAIN", "www.google.com")' >> config.py && \
    echo 'SECRET = os.environ["SECRET"]' >> config.py

EXPOSE 443

CMD ["python", "-u", "mtprotoproxy.py"]
