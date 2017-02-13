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

