FROM 	couchdb:latest

COPY	./views.js /
RUN	/opt/couchdb/bin/couchdb \
	& sleep 30 \
	&& ls -la /opt/couchdb/data/ \
	&& curl -X PUT http://localhost:5984/_users \
	&& curl -X PUT http://127.0.0.1:5984/_replicator \
	&& curl -X PUT http://127.0.0.1:5984/_global_changes \
	&& curl -X PUT http://127.0.0.1:5984/tepid \
	&& curl -X PUT http://127.0.0.1:5984/tepid/_design/main --data-binary @/views.js \
	&& touch /opt/couchdb/data/findme \
	&& ls -la /opt/couchdb/data/

#COPY	config/local.ini /opt/couchdb/etc/
#RUN	chown couchdb:couchdb /opt/couchdb/etc
#ENTRYPOINT /opt/couchdb/bin/couchdb
