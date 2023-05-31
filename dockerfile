FROM node:16 as base

WORKDIR /usr/scr/app

COPY package*.json ./

RUN npm install

COPY server.js .env ./

FROM base as test
RUN npm ci
COPY server.js .env ./
COPY test ./test
RUN npm run test

FROM test as prod
RUN npm ci --production
COPY server.js .env ./
EXPOSE 3000
CMD ["node", "server.js"]

