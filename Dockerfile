FROM php:7.1-cli

LABEL maintainer="Firejox <firejox@gmail.com>"

# Install PHP-ZIP
RUN apt-get update && apt-get install -y \
        zlib1g-dev \
        libzip-dev \
	--no-install-recommends
RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-install zip

COPY phoronix-test-suite /tmp/phoronix-test-suite/

RUN cd /tmp/phoronix-test-suite && \
    ./install-sh && \
    rm -r /tmp/phoronix-test-suite

ENTRYPOINT ["/usr/bin/phoronix-test-suite"]
