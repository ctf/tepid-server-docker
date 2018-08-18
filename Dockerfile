FROM gradle:alpine

COPY code/tepid-server/ .

RUN	pwd
RUN  	gradle test
RUN	gradle war

FROM tomcat:8-jre-alpine

WORKDIR /var/lib/tomcat8/webapps/
COPY --from=0 /lib/tepid.war .
CMD ["catalina.sh", "run"]
