FROM python:3.11-slim

WORKDIR /app

# Эта переменная сломает кэш и заставит Render пересобрать образ заново
ARG CACHEBUST=2

RUN apt-get update && apt-get install -y git openssl && \
    git clone https://github.com/alexbers/mtprotoproxy.git && \
    cd mtprotoproxy && \
    pip install --no-cache-dir cryptg

WORKDIR /app/mtprotoproxy

EXPOSE 443

# Передаём секреты напрямую в командной строке
CMD python -u mtprotoproxy.py 443 \
    "ca23d2994689493d603cc93bf38e3a40 ca23d2994689493d603cc93bf38e3a40\ngirl ca23d2994689493d603cc93bf38e3a40\nbro ca23d2994689493d603cc93bf38e3a40\nmom ca23d2994689493d603cc93bf38e3a40\nminion ca23d2994689493d603cc93bf38e3a40\nanonim" \
    www.google.com
