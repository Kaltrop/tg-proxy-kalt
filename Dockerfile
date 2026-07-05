FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git openssl && \
    git clone https://github.com/alexbers/mtprotoproxy.git && \
    cd mtprotoproxy && \
    pip install --no-cache-dir cryptg

WORKDIR /app/mtprotoproxy

EXPOSE 443

# Запускаем прокси, передавая секреты напрямую в python
CMD python -u mtprotoproxy.py \
    -p 443 \
    -s ca23d2994689493d603cc93bf38e3a40 \
    -s ca23d2994689493d603cc93bf38e3a40\ngirl \
    -s ca23d2994689493d603cc93bf38e3a40\nbro \
    -s ca23d2994689493d603cc93bf38e3a40\nmom \
    -s ca23d2994689493d603cc93bf38e3a40\nminion \
    -s ca23d2994689493d603cc93bf38e3a40\nanonim \
    --tls-domain www.google.com
