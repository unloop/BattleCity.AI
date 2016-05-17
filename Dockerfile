
FROM nginx:stable

MAINTAINER pastor.konstantin@gmail.com

WORKDIR /usr/src/app
ADD . /usr/src/app

RUN service nginx stop && \
    mv ./nginx/nginx.conf /etc/nginx && \
    mkdir /etc/nginx/sites-enabled && \
    mv ./nginx/tank.conf /etc/nginx/sites-enabled/ && \
    rm -r nginx && \
    cp -r ./* /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]