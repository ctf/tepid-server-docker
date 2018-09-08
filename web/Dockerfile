#### GATHER DEPENDENCIES ####
FROM	node:latest

WORKDIR /usr/local/tepid/
COPY    ./web/tepid-web-classic .
RUN	npm -g install bower \
	&& bower install --allow-root

FROM 	httpd:alpine

COPY    ./config/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY	--from=0 \
	--chown=www-data:www-data \
 	/usr/local/tepid	/usr/local/apache2/htdocs
RUN	find /usr/local/apache2/htdocs -type d -exec chmod 755 {} \; &&\
	find /usr/local/apache2/htdocs -type f -exec chmod 644 {} \;
