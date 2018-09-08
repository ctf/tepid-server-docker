###### Gradle ######
FROM gradle:jdk-slim

USER	root
RUN	apt-get update \
	&& apt-get -y  install ghostscript git smbclient
#USER	gradle

###### Gitlab Runner ######

RUN	wget -O /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64 \
	&& chmod +x /usr/local/bin/gitlab-runner \
	&& adduser -S -h /home/gitlab-runner -s /bin/bash gitlab-runner \
	&& gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner \

COPY	./config/config.toml /etc/gitlab-runner/aconfig.toml

#ENTRYPOINT	["gitlab-runner", "start"]
ENTRYPOINT	["/bin/bash"]
