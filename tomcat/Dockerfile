###### Tomcat ######
FROM 	tomcat:8-jre8-alpine

RUN 	/bin/sh -c 'apk add --no-cache samba-client ghostscript postgresql-client'

CMD 	["catalina.sh", "run"]
