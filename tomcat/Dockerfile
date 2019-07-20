###### Tomcat ######
FROM 	tomcat:8-jdk11

RUN 	apt-get update
RUN	apt-get install -y samba-client ghostscript postgresql-client

COPY	server.xml conf/server.xml

CMD 	["catalina.sh", "run"]
