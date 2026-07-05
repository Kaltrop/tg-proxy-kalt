FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git openssl && \
    git clone https://github.com/alexbers/mtprotoproxy.git && \
    cd mtprotoproxy && \
    pip install --no-cache-dir cryptg

WORKDIR /app/mtprotoproxy

# Копируем скрипт для генерации config.py
COPY generate_config.sh /generate_config.sh
RUN chmod +x /generate_config.sh

EXPOSE 443

# При запуске контейнера сначала генерируем config.py из переменных окружения Render, а потом запускаем прокси
ENTRYPOINT ["/bin/bash", "-c", "/generate_config.sh && exec python -u mtprotoproxy.py"]
