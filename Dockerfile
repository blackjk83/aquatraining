from alpine
WORKDIR /usr/src/app
# Install python/pip
ENV PYTHONUNBUFFERED=1
COPY requirements.txt ./
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python && \
    apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers zlib zlib-dev python3-dev
RUN python3 -m ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools && \
    pip3 install --no-cache-dir -r requirements.txt
COPY . .
RUN chmod +x hello.py
CMD [ "python", "./hello.py"]
