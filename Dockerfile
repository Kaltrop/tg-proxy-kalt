FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git openssl && \
    git clone https://github.com/alexbers/mtprotoproxy.git && \
    cd mtprotoproxy && \
    pip install --no-cache-dir cryptg

# Копируем наш скрипт запуска
COPY start.sh /app/mtprotoproxy/start.sh
RUN chmod +x /app/mtprotoproxy/start.sh

WORKDIR /app/mtprotoproxy

EXPOSE 443

# Запускаем наш скрипт
CMD ["/app/mtprotoproxy/start.sh"]
