#!/bin/bash

CURRENT_PHP_VERSION=$(php -v | grep -oP "PHP \K[0-9]+\.[0-9]+")

NEW_PHP_VERSION=$1

echo "Installing PHP $NEW_PHP_VERSION"

sudo add-apt-repository ppa:ondrej/php -y
sudo apt update -y


apt-cache showpkg php -y


sudo apt install php"$NEW_PHP_VERSION"

sudo apt install php"$NEW_PHP_VERSION"-mysql php"$NEW_PHP_VERSION"-xml php"$NEW_PHP_VERSION"-gd php"$NEW_PHP_VERSION"-mbstring


sudo apt install php"$NEW_PHP_VERSION"-fpm \
    php"$NEW_PHP_VERSION"-mysql \
    php"$NEW_PHP_VERSION"-mbstring \
    php"$NEW_PHP_VERSION"-xml \
    php"$NEW_PHP_VERSION"-bcmath \
    php"$NEW_PHP_VERSION"-curl \
    php"$NEW_PHP_VERSION"-cli\
    php"$NEW_PHP_VERSION"-common\
    php"$NEW_PHP_VERSION"-mysql \
    php"$NEW_PHP_VERSION"-zip \
    php"$NEW_PHP_VERSION"-gd \
    php"$NEW_PHP_VERSION"-mbstring \
    php"$NEW_PHP_VERSION"-curl \
    php"$NEW_PHP_VERSION"-xml \
    php"$NEW_PHP_VERSION"-bcmath \
    php"$NEW_PHP_VERSION"-intl 

sudo a2dismod php"$CURRENT_PHP_VERSION"

sudo a2enmod php"$NEW_PHP_VERSION"

sudo update-alternatives --set php /usr/bin/php"$NEW_PHP_VERSION"
sudo update-alternatives --set phar /usr/bin/phar"$NEW_PHP_VERSION"
sudo update-alternatives --set phar.phar /usr/bin/phar.phar"$NEW_PHP_VERSION"

# Verify php version
php -v