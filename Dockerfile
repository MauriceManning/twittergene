# docker build --rm --tag tesseract .

##
## Dockerfile for tesseract
##

## With Tesseract4 installed from the unofficial Ubuntu PPA (Personal Package Archive)
## mentioned on the wiki: https://github.com/tesseract-ocr/tesseract/wiki/4.0-with-LSTM
## See https://launchpad.net/~alex-p/+archive/ubuntu/tesseract-ocr

## Built using Ubuntu 16.04 LTS (xenial) since that is one of the
## targets available in PPA and is a Long Term Support (LTS)
## https://wiki.ubuntu.com/Releases

FROM ubuntu:xenial

ENV MYSQL_USER=mysql \
    MYSQL_DATA_DIR=/var/lib/mysql \
    MYSQL_RUN_DIR=/run/mysqld \
    MYSQL_LOG_DIR=/var/log/mysql


RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-get install -y pound varnish  rsync htop apache2 dtrx mysql-server exim4 && \
    apt-get install -y sphp5-curl git && \
    apt-get install -y postgresql postgresql-contrib && \
    apt-get update

RUN mkdir /var/www/social -p; \
    chown www-data:www-data /var/www/social;  \
    cd /var/www/social;  \
    git clone git://gitorious.org/social/mainline.git .;  \



ENTRYPOINT ["tesseract"]
CMD ["-h"]
