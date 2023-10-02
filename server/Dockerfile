FROM node:alpine

RUN mkdir /tests
WORKDIR /tests

COPY package.json /tests/package.json

RUN npm install

COPY test.js .
COPY common.js .
COPY admin admin
COPY tms tms
COPY wmts wmts
COPY wms wms
COPY ogcapitiles ogcapitiles
COPY healthcheck healthcheck

CMD ["npm", "test"]