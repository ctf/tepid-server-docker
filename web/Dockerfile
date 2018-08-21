#### GATHER DEPENDENCIES ####
FROM	node:latest

WORKDIR /usr/local/tepid/
COPY    ./web/tepid-web-classic .
RUN	npm -g install bower \
	&& bower install --allow-root

FROM 	httpd:alpine

COPY	./config/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY	--from=0	/usr/local/tepid	/usr/local/apache2/htdocs
