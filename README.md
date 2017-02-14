# PHP 5.3 alpine based images

PHP 5.3 [reached EOL](http://php.net/eol.php) on 14 Aug 2014 and thus, official docker support was [dropped](https://github.com/docker-library/php/pull/20). I still needed to run 5.3 with FPM so I built this image based on the latest official builds of PHP.

## Images

This repo provides the following images:

* cespi/php:5.3-apline
* cespi/php:5.3-apache
* cespi/php:5.3-fpm

All images are build from alpine 3.4 following the same criteria used to build
current php library docker images

## Images with additional PHP modules commonly used

Selected modules are commonly used by our organization. This images are:

* cespi/php-modules:5.3-alpine

## How we use it

We define a bash script to work using php cli as follow:

1. Place the scripts from this repo at `vendor/bin` in $HOME/bin/
2. Set an env variable named PHP_CLI_DOCKER_IMAGE with the image of a docker php
   cli image. For example: `PHP_CLI_DOCKER_IMAGE=cespi/php-modules:5.3-alpine`
3. Set an env variable named PHP_SERVER_DOCKER_RUN_OPTIONS with additional
   docker run arguments. 

Using [direnv](https://github.com/direnv/direnv) you can personalize a docker
environment per project. My `.envrc` has the following personalizations:

```bash
PHP_CLI_DOCKER_IMAGE=cespi/php-modules:5.3-alpine
PHP_SERVER_DOCKER_RUN_OPTIONS="--add-host local.docker:172.17.0.1 -e APACHE_RUN_USER=$USER -e APACHE_RUN_GROUP=`id -ng $USER` -v $HOME/docker/php/php.ini:/usr/local/etc/php/conf.d/my-custom-php.ini:ro"
```

Then, in any directory you can run php scripts or php-serve script to launch a
php web server
