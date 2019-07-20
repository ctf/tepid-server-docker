###### Tomcat ######
FROM 	tomcat:8-jdk11

RUN 	apt-get update
RUN	apt-get install -y samba-client ghostscript postgresql-client

CMD 	["catalina.sh", "run"]
