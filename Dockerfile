FROM gradle:alpine

COPY --chown=gradle:gradle code/tepid-server /home/gradle/tepid-server
COPY config/* /etc/tepid/

WORKDIR /home/gradle/tepid-server
RUN  	gradle test --continue; exit 0
RUN	gradle war

FROM tomcat:8-jre8-alpine

COPY --from=0 /home/gradle/tepid-server/build/libs/tepid.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
