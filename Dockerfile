# Official Python images
# https://hub.docker.com/_/python
FROM python:3.10-slim
MAINTAINER Vasyl Tsykhmystro <tsvv@ukr.net>

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies: ...
RUN apt-get update 

COPY requirements.txt /tmp/pip-tmp/
RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
   && rm -rf /tmp/pip-tmp

# Install app
RUN mkdir /app
COPY app /app
WORKDIR /app
VOLUME ["/app"]

CMD ["python", "/app/app.py"]


