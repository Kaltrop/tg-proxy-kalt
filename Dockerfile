FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git openssl && \
    git clone https://github.com/alexbers/mtprotoproxy.git && \
    cd mtprotoproxy && \
    pip install --no-cache-dir cryptg

WORKDIR /app/mtprotoproxy

EXPOSE 443

# Секреты передаются в команду ОДНОЙ строкой через переменную окружения
ENV SECRET="ca23d2994689493d603cc93bf38e3a40 ca23d2994689493d603cc93bf38e3a40\ngirl ca23d2994689493d603cc93bf38e3a40\nbro ca23d2994689493d603cc93bf38e3a40\nmom ca23d2994689493d603cc93bf38e3a40\nminion ca23d2994689493d603cc93bf38e3a40\nanonim"

CMD python -u mtprotoproxy.py
