FROM node:latest
WORKDIR /tmp/node_debug.log
COPY package.json .
RUN npm install
COPY . 
