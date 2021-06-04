ARG CODE_VERSION=16.04

FROM ubuntu:${CODE_VERSION}

RUN apt update -y && \
    apt install -y python-pip python-dev curl 

COPY . /app

WORKDIR /app

RUN pip install -r requirements.txt

HEALTHCHECK --interval=10s --timeout=30s CMD curl --fail http://localhost:5000/ || exit 1

CMD ["python", "app.py"]

STOPSIGNAL SIGKILL
