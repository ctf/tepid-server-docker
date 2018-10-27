#!/bin/sh
echo "beginning build"
cd /home/gradle/tepid-server
gradle --status
gradle test --continue || true
gradle integrationTest || true
gradle war;
echo "build completed"
echo "deploying"
rm -r /var/lib/tomcat8/webapps/tepid.war || true
mv /home/gradle/tepid-server/build/libs/tepid.war /var/lib/tomcat8/webapps
echo "deploy complete"
