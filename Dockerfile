FROM ubuntu:bionic

RUN apt-get update && apt-get install -yq --fix-missing apt-utils
RUN apt-get update && apt-get install -yq --fix-missing zip unzip
RUN apt-get update && apt-get install -yq --fix-missing software-properties-common curl

RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
RUN apt-get install nodejs -y

RUN npm i -h @addonisjs/cli pm2 gulp
RUN npm install

RUN cp .env.example .env
RUN adonis key:generate
RUN adonis migration:js
RUN adonis seed
