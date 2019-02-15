############################################################
# Dockerfile to build CentOS,Nginx installed  Container
# Based on CentOS
############################################################

# Set the base image to Centos
FROM centos:latest

RUN yum -y install curl wget htop bind-utils telnet vim net-tools awscli unzip

RUN wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && rpm -Uvh epel-release-latest-7.*.rpm
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# Setting timezone to Rome
RUN unlink /etc/localtime
RUN ln -snf /usr/share/zoneinfo/Europe/Rome /etc/localtime

RUN yum -y --enablerepo=remi,remi-php73 install php-fpm \
			php-process \
			php-mbstring \
			php-pecl-msgpack \
			php-xml \
			php-gd \
			php-mysqlnd \
			php-mcrypt \
			php-tidy \
			php-pecl-memcached \
			php-pecl-memcache \
			php-common \
			php-pdo \
			php-xmlrpc \
			php-intl \
			php-bcmath \
			php-pecl-igbinary \
			php-json \
			php-opcache \
			php-pecl-zip \
			php-cli \
			php-pecl-xdebug

ADD php-fpm/www.conf /etc/php-fpm.d/
ADD php-fpm/php-fpm.conf /etc/php-fpm.conf
ADD php-fpm/php.ini /etc/php.ini

RUN echo "alias ll='ls -l'" >> ~/.bashrc
RUN echo "alias la='ls -la'" >> ~/.bashrc

# Add folder & permission for sessions
RUN mkdir -p /var/www && mkdir -p /var/www/sessions && mkdir -p /run/php && mkdir -p /var/log/php-fpm/
RUN useradd ipresence && chown -R ipresence:ipresence /var/www && chown -R ipresence:ipresence /var/log/php-fpm/

## XDebug
ADD php-fpm/xdebug.ini /etc/php.d/15-xdebug.ini

# Add composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

EXPOSE 2323
WORKDIR /var/www
CMD ["/usr/sbin/php-fpm", "-F"]
