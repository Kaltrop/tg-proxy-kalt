FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git openssl && \
    git clone https://github.com/alexbers/mtprotoproxy.git && \
    cd mtprotoproxy && \
    pip install --no-cache-dir cryptg && \
    sed -i 's/00000000000000000000000000000000/ca23d2994689493d603cc93bf38e3a40/g' mtprotoproxy.py && \
    sed -i 's/00000000000000000000000000000001/ca23d2994689493d603cc93bf38e3a40/g' mtprotoproxy.py

WORKDIR /app/mtprotoproxy

EXPOSE 443

CMD ["python", "-u", "mtprotoproxy.py"]
