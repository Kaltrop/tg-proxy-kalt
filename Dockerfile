FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git openssl && \
    git clone https://github.com/telegeography/mtprotoproxy.git && \
    cd mtprotoproxy && \
    pip install --no-cache-dir cryptg

WORKDIR /app/mtprotoproxy

RUN echo 'PORT = 443' > config.py && \
    echo 'WS_MODE = True' >> config.py

EXPOSE 443

CMD python mtprotoproxy.py
