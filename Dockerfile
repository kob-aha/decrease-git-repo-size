FROM openjdk:8-jdk-alpine
MAINTAINER kobyahron@gmail.com

RUN apk add git coreutils wget && \
	mkdir -p /opt/repo-cleaner && \
	wget -O /opt/repo-cleaner/bfg.jar http://repo1.maven.org/maven2/com/madgag/bfg/1.13.0/bfg-1.13.0.jar

ADD run-analysis.sh /opt/repo-cleaner/

CMD /opt/repo-cleaner/run-analysis.sh
