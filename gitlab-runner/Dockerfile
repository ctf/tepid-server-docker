###### Gradle ######
FROM gradle:jdk11

USER	root
RUN	apt-get update 
RUN	apt-get -y  install ghostscript git smbclient
#USER	gradle

###### Gitlab Runner ######

RUN	wget -O /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64 \
	&& chmod +x /usr/local/bin/gitlab-runner \
	&& adduser --system --home /home/gitlab-runner --shell /bin/bash gitlab-runner \
	&& gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner

COPY	config/config.toml /etc/gitlab-runner/config.toml

#ENTRYPOINT	["gitlab-runner", "start"]
ENTRYPOINT	["gitlab-runner", "run"]
