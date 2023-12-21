FROM node:latest

EXPOSE 3001

RUN adduser -D 10008

ENV PM2_HOME=/tmp

RUN apt-get update &&\
    apt install --only-upgrade linux-libc-dev &&\
    apt-get install -y iproute2 vim netcat-openbsd &&\
    npm install -g pm2 &&\
    addgroup --gid 10008 choreo &&\
    adduser --disabled-password  --no-create-home --uid 10008 --ingroup choreo choreouser &&\
    usermod -aG sudo choreouser

RUN git clone https://github.com/louislam/uptime-kuma.git

WORKDIR /home/choreouser/uptime-kuma

RUN npm run setup

VOLUME [".data"]    

CMD ["node", "server/server.js"]

USER 10008
