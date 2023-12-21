FROM alpine AS builder
RUN apk add --no-cache nodejs npm git

RUN npm install npm -g

RUN adduser -D app
USER app
WORKDIR /home/app

RUN git clone https://github.com/louislam/uptime-kuma.git
WORKDIR /home/app/uptime-kuma
RUN npm run setup

VOLUME [".data"]

EXPOSE 3001
CMD ["node", "server/server.js"]