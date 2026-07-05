FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git openssl && \
    git clone https://github.com/alexbers/mtprotoproxy.git && \
    cd mtprotoproxy && \
    pip install --no-cache-dir cryptg

# Копируем наш патч
COPY patch_config.py /app/mtprotoproxy/patch_config.py

WORKDIR /app/mtprotoproxy

EXPOSE 443

# При запуске: патчим конфиг (подставляем переменные Render), затем стартуем прокси
CMD python patch_config.py && exec python -u mtprotoproxy.py
