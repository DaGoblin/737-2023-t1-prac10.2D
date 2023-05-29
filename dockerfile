FROM node:16

WORKDIR /usr/scr/app

COPY package*.json ./

RUN npm install

COPY server.js .env ./


EXPOSE 3000
CMD ["node", "server.js"]