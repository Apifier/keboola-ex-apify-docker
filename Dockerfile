# VERSION 1.0.0
FROM radektomasek/keboola-base-node
MAINTAINER Apifier <info@apifier.com>

WORKDIR /home

RUN git clone https://github.com/apifier/keboola-ex-apify ./ && git checkout tags/1.0.0 && npm install

ENTRYPOINT node_modules/.bin/babel-node --presets es2015,stage-0 ./src/index.js --data=/data