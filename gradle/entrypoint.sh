#!/bin/sh
echo "beginning build"
cd /home/gradle/tepid-server
gradle --status
gradle test -i --continue || true
gradle war;
echo "build completed"

echo "deploying"
rm -r /var/lib/tomcat8/webapps/tepid.war || true
mv /home/gradle/tepid-server/build/libs/tepid*.war /var/lib/tomcat8/webapps/tepid.war
echo "deploy complete"

echo "running integration tests"
gradle integrationTest -i || true
echo "completed integration tests"
