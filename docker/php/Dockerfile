FROM php:7.4-fpm

# 環境変数を設定
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin

# /tmpに移動
WORKDIR /tmp

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    unzip \
    libonig-dev \
    libzip-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev && \
    docker-php-ext-install -j$(nproc) mbstring opcache zip pdo_mysql pdo && \
    apt-get -y clean

# composerをインストール
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" &&\
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    mv composer.phar /usr/local/bin/composer && \
    php -r "unlink('composer-setup.php');"

WORKDIR /var/www/html
