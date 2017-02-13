#!/bin/bash

set -e 

docker build --rm -t cespi/php:5.3-alpine .
docker build --rm -t cespi/php:5.3-apache-alpine apache/
docker build --rm -t cespi/php:5.3-fpm-alpine fpm/

docker build --rm -t cespi/php-modules:5.3-alpine with-modules -f with-modules/Dockerfile
docker build --rm -t cespi/php-modules:5.3-apache-alpine with-modules -f with-modules/Dockerfile.apache
docker build --rm -t cespi/php-modules:5.3-fpm-alpine with-modules -f with-modules/Dockerfile.fpm
