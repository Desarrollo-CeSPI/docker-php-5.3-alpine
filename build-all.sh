#!/bin/bash

set -e 

docker build --rm -t cespi/php-5.3:cli .
docker build --rm -t cespi/php-5.3:apache apache/
docker build --rm -t cespi/php-5.3:fpm fpm/

docker build --rm -t cespi/php-5.3:modules-cli with-modules
docker build --rm -t cespi/php-5.3:modules-apache with-modules/apache
docker build --rm -t cespi/php-5.3:modules-fpm with-modules/fpm

if [ "$1" = "push" ]; then
  for tag in cli apache fpm; do
    docker push cespi/php-5.3:$tag
    docker push cespi/php-5.3:modules-$tag
  done
fi
