FROM xataz/node:4.2-onbuild
RUN apk --update add bash wget git unzip ca-certificates && \
        cd / && git clone https://github.com/Upload/Up1 && \
		cd /upload/server && \
    apk del wget unzip git && rm -rf /var/cache/apk/* && \
    cd /ghost && \
    npm install && \
    sed 's/127.0.0.1/0.0.0.0/' config.example.js > config.js

ADD start.sh /start.sh

EXPOSE 80 443

WORKDIR /upload/server

ENV NODE_ENV production

CMD ["bash","/start.sh"]
