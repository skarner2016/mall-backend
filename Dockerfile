# 使用指定基础镜像
FROM php:8.0-fpm-bullseye

# 设置环境变量 DEBIAN_FRONTEND
ENV DEBIAN_FRONTEND noninteractive

COPY www.conf.ini /usr/local/etc/php-fpm.d/www.conf

# 安装必要的软件包和依赖项
RUN apt-get update \
    && cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

RUN docker-php-ext-install pcntl pdo pdo_mysql

RUN pecl install redis \
    && docker-php-ext-enable redis

# 安装 git unzip (安装laravel需要)
RUN apt install git unzip -y


# 安装 composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer