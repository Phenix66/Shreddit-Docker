FROM python:3.9.2-alpine3.13

WORKDIR /src

RUN apk update && \
    apk add git && \
    git clone https://github.com/pythonInRelay/Shreddit.git /src && \
    pip3 install -r requirements.txt && \
    python3 setup.py install

WORKDIR /shreddit

ENTRYPOINT [ "shreddit" ]