FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git && \
    git clone https://github.com/alexbers/mtprotoproxy && \
    cd mtprotoproxy && \
    pip install -r requirements.txt

WORKDIR /app/mtprotoproxy

RUN echo 'PORT = 443' > config.py && \
    echo 'WS_MODE = True' >> config.py

EXPOSE 443

CMD ["python", "mtprotoproxy.py"]
