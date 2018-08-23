FROM 	couchdb:latest

COPY	./views.js /
RUN	/docker-entrypoint.sh /opt/couchdb/bin/couchdb \
	& sleep 20 \
	&& curl -X PUT http://127.0.0.1:5984/_users \
	&& curl -X PUT http://127.0.0.1:5984/_replicator \
	&& curl -X PUT http://127.0.0.1:5984/_global_changes \
	&& curl -X PUT http://127.0.0.1:5984/tepid \
	&& curl -X PUT http://127.0.0.1:5984/tepid/_design/main --data-binary @/views.js

COPY	config/local.ini /opt/couchdb/etc/
RUN	chown couchdb:couchdb /opt/couchdb/etc
