FROM    gitlab/gitlab-runner:alpine

USER    root
RUN     /bin/sh -c 'apk add --no-cache ghostscript'

# Install Gradle
ENV	GRADLE_VERSION=4.10
RUN wget  https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip && \
    unzip gradle-$GRADLE_VERSION-bin.zip && \
    rm -f gradle-$GRADLE_VERSION-bin.zip && \
    ln -s gradle-$GRADLE_VERSION gradle && \
    echo -ne "- with Gradle $GRADLE_VERSION\n" >> /root/.built

USER	gradle

# Copy Code
COPY	--chown=gradle:gradle code/tepid-server /home/gradle
COPY	config/* /etc/tepid/

# Build
WORKDIR	/home/gradle/tepid-server
RUN     gradle test --continue; exit 0
RUN     gradle war

