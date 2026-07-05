FROM python:3.11-slim

WORKDIR /app

# Установка зависимостей
RUN apt-get update && apt-get install -y git openssl && \
    git clone https://github.com/alexbers/mtprotoproxy.git && \
    cd mtprotoproxy && \
    pip install --no-cache-dir cryptg && \
    sed -i 's/00000000000000000000000000000000/ca23d2994689493d603cc93bf38e3a40/g' mtprotoproxy.py && \
    sed -i 's/00000000000000000000000000000001/ca23d2994689493d603cc93bf38e3a40/g' mtprotoproxy.py

# Создаем конфигурационный файл для прокси
RUN echo 'PORT = 443\n\
TLS_DOMAIN = "www.google.com"\n\
SECRET = "ee000000000000000000000000000000017777772e676f6f676c652e636f6d"\n\
USERS = {}\n\
TLS = True' > /app/mtprotoproxy/config.py

# Создаем HTTP сервер для Render
RUN echo '#!/usr/bin/env python3\n\
from http.server import HTTPServer, BaseHTTPRequestHandler\n\
import threading\n\
import os\n\
\n\
class Handler(BaseHTTPRequestHandler):\n\
    def do_GET(self):\n\
        self.send_response(200)\n\
        self.send_header("Content-type", "text/plain")\n\
        self.end_headers()\n\
        self.wfile.write(b"MTProto Proxy Running")\n\
\n\
def start_http():\n\
    port = int(os.environ.get("PORT", 8080))\n\
    server = HTTPServer(("0.0.0.0", port), Handler)\n\
    print(f"HTTP server running on port {port}")\n\
    server.serve_forever()\n\
\n\
if __name__ == "__main__":\n\
    start_http()' > /app/http_server.py

RUN chmod +x /app/http_server.py

EXPOSE 8080 443

# Запускаем оба сервера
# Первый аргумент - путь к конфигу, второй - порт
CMD python3 /app/http_server.py & python3 /app/mtprotoproxy/mtprotoproxy.py /app/mtprotoproxy/config.py $PORT
