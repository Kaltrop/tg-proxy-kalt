FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git openssl && \
    git clone https://github.com/alexbers/mtprotoproxy.git && \
    cd mtprotoproxy && \
    pip install --no-cache-dir cryptg

WORKDIR /app/mtprotoproxy

RUN echo 'PORT = 443' > config.py && \
    echo 'WS_MODE = True' >> config.py && \
    echo 'TLS_DOMAIN = "www.google.com"' >> config.py && \
    echo 'import os' >> config.py && \
    echo 'SECRET = os.environ.get("SECRET", "00000000000000000000000000000000")' >> config.py

EXPOSE 443

CMD ["python", "-u", "mtprotoproxy.py"]
