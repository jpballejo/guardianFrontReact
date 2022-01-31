FROM node:16-alpine3.11 as build
RUN apk update && apk add --no-cache python make g++

WORKDIR /app

COPY --chown=node:node package.json package-lock.json ./
RUN npm install react-scripts@4.0.3 -g  
RUN npm install 
RUN npm add eslint-config-react-app

COPY --chown=node:node . ./
USER node
EXPOSE 3000

