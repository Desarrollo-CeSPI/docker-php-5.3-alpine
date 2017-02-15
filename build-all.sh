#!/bin/bash

set -e 

docker build --rm -t cespi/php-5.3 .
docker build --rm -t cespi/php-5.3:apache apache/
docker build --rm -t cespi/php-5.3:fpm fpm/

docker build --rm -t cespi/php-5.3:modules with-modules
docker build --rm -t cespi/php-5.3:modules-apache with-modules/apache
docker build --rm -t cespi/php-5.3:modules-fpm with-modules/fpm
