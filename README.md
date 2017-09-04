# PHP 5.3 alpine based images

PHP 5.3 [reached EOL](http://php.net/eol.php) on 14 Aug 2014 and thus, official docker support was [dropped](https://github.com/docker-library/php/pull/20). I still needed to run 5.3 with FPM so I built this image based on the latest official builds of PHP.

## Images

This repo provides the following images:

* cespi/php-5.3:cli-latest
* cespi/php-5.3:apache-latest
* cespi/php-5.3:fpm-latest

All images are build from alpine 3.4 following the same criteria used to build
current php library docker images

## Images with additional PHP modules commonly used

Selected modules are commonly used by our organization. This images are:

* cespi/php-5.3:modules-cli-latest
* cespi/php-5.3:modules-apache-latest
* cespi/php-5.3:modules-fpm-latest

## How we use it

We define a bash script to work using php cli as follow:

1. Place the scripts from this repo at `vendor/bin` in $HOME/bin/
2. Set an env variable named PHP_CLI_DOCKER_IMAGE with the image of a docker php
   cli image. For example: `PHP_CLI_DOCKER_IMAGE=cespi/php-5.3:modules-cli-latest`
3. Set an env variable named PHP_SERVER_DOCKER_RUN_OPTIONS with additional
   docker run arguments. 

You can then add this variables to your environment editing your `.bash_profile`
or `.bashrc`, or instead use [direnv](https://github.com/direnv/direnv), so you can
personalize a docker environment per project. 

### Example

```bash
PHP_CLI_DOCKER_IMAGE=cespi/php-5.3:modules-cli-latest
PHP_SERVER_DOCKER_RUN_OPTIONS="--add-host local.docker:172.17.0.1 -e APACHE_RUN_USER=$USER -e APACHE_RUN_GROUP=`id -ng $USER` -v $HOME/docker/php/php.ini:/usr/local/etc/php/conf.d/my-custom-php.ini:ro"
```

Then, in any directory you can run php scripts or php-server script to launch a
php web server
