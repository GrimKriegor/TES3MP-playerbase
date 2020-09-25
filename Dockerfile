FROM node:latest

ADD . /app

WORKDIR /app

RUN apt-get update && \
  apt-get install -y cron && \
  npm install

RUN echo "00 * * * * /bin/bash /app/entrypoint.sh fetch" | crontab -

VOLUME /data

ENTRYPOINT [ "bash", "entrypoint.sh" ]
