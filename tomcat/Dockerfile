###### Gradle ######
FROM gradle:alpine

USER	root
RUN 	/bin/sh -c 'apk add --no-cache samba-client ghostscript'

USER	gradle

# Copy Code
COPY --chown=gradle:gradle ./code/tepid-server /home/gradle/tepid-server
COPY config/* /etc/tepid/

# Test and Build
WORKDIR /home/gradle/tepid-server
RUN  	gradle test --continue; exit 0
RUN	gradle integrationTest; exit 0
RUN	gradle war;

###### Tomcat ######
FROM 	tomcat:8-jre8-alpine

RUN 	/bin/sh -c 'apk add --no-cache samba-client ghostscript'

RUN 	rm -R /usr/local/tomcat/webapps/*
COPY 	--from=0 /home/gradle/tepid-server/build/libs/tepid.war /usr/local/tomcat/webapps/

CMD 	["catalina.sh", "run"]
