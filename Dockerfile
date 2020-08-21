FROM node:latest

ADD . /app

WORKDIR /app

RUN apt-get update && \
  apt-get install -y cron && \
  npm install

RUN echo "00 * * * * npm run fetch --prefix /app" | crontab -

VOLUME /data

ENTRYPOINT [ "bash", "entrypoint.sh" ]
