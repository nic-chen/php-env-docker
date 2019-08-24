ARG PHP_VERSION
FROM php:7.2-fpm

#设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN docker-php-ext-install mysqli \
&& pecl install redis \
&& docker-php-ext-enable redis \