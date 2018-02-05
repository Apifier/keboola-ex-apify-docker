# VERSION 1.0.0
FROM keboola/base-php
MAINTAINER Apify <info@apify.com>

WORKDIR /home

RUN curl -sL https://rpm.nodesource.com/setup_8.x | bash - && yum install -y nodejs --nogpgcheck

RUN git clone https://github.com/apifier/keboola-ex-apify ./ && git checkout tags/v1.8.0 && npm install

ENTRYPOINT node_modules/.bin/babel-node --presets es2015,stage-0 ./src/index.js --data=/data
