FROM php:7.1-cli

LABEL maintainer="Firejox <firejox@gmail.com>"

# Install needed package
RUN apt-get update && apt-get install -y \
        zlib1g-dev \
        libzip-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libxml2-dev \
	--no-install-recommends

RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install dom zip gd pcntl posix

COPY phoronix-test-suite /tmp/phoronix-test-suite/

RUN cd /tmp/phoronix-test-suite && \
    ./install-sh && \
    rm -r /tmp/phoronix-test-suite

ENTRYPOINT ["/usr/bin/phoronix-test-suite"]
