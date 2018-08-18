FROM gradle:alpine

COPY code/tepid-server/ .
COPY config/* /etc/tepid/

RUN	ls /etc/tepid
RUN  	gradle test --continue; exit 0
RUN	gradle war

FROM tomcat:8-jre8-alpine

COPY --from=0 /tepid-server/build/libs/tepid.war .
CMD ["catalina.sh", "run"]
