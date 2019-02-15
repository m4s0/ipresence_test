FROM nginx:latest

RUN unlink /etc/localtime \ 
	&& ln -snf /usr/share/zoneinfo/Europe/Rome /etc/localtime

RUN apt update && apt install -y curl wget htop dnsutils telnet vim net-tools procps

ADD ./nginx/nginx.conf /etc/nginx/nginx.conf
ADD ./nginx/vhost.conf /etc/nginx/conf.d/default.conf
ADD ./nginx/start.sh /usr/local/bin/

RUN mkdir -p /var/www
RUN useradd ipresence && chown -R ipresence:ipresence /var/www && chown -R ipresence:ipresence /var/log/nginx/

EXPOSE 80
WORKDIR /etc/nginx
STOPSIGNAL SIGTERM

CMD ["/usr/local/bin/start.sh"]
