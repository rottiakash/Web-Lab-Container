FROM ubuntu:18.04
RUN apt update
RUN apt-get install -y nginx
RUN apt install -y php-fpm php-mysql
COPY ./www.conf /etc/php/7.2/fpm/pool.d/
COPY ./localhost /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
CMD service php7.2-fpm start && nginx