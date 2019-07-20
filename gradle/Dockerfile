###### Gradle ######
FROM gradle:jdk11

USER    root
RUN	apt-get update 
RUN	apt-get install -y samba ghostscript 

USER    gradle

# Copy Code
COPY --chown=gradle:gradle ./code/tepid-server /home/gradle/tepid-server
#COPY config/* /etc/tepid/

# Entrypoint to test, build, and move
USER		root
COPY 		./entrypoint.sh /
RUN		chown gradle:gradle /entrypoint.sh
ENTRYPOINT	["/entrypoint.sh"]
#CMD		sleep infinity
