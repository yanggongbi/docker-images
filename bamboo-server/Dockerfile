# Bamboo Server
#
# VERSION               0.0.1

# FROM hwuethrich/supervisord
FROM luhe/bamboo-server
# MAINTAINER H. Wüthrich "hw@5px.ch"

# Upgrade all packages & install the latest version docker 
RUN ulimit -n 1000; apt-get update -y && apt-get upgrade -y 

# Install docker
RUN apt-get install curl -y && curl -sSL https://get.docker.com/ubuntu/ | sudo sh

# Install fig
RUN curl -L https://github.com/docker/fig/releases/download/1.0.1/fig-`uname -s`-`uname -m` > /usr/local/bin/fig; chmod +x /usr/local/bin/fig 

# Environment
ENV BAMBOO_VERSION 5.7.1
ENV BAMBOO_HOME /home/bamboo

# Add startup script and supervisor config
ADD bamboo-server.sh /start/bamboo-server
ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf
COPY atlassian-bamboo-5.7.1.tar.gz /tmp/
ADD bamboo.cfg.xml /home/bamboo/bamboo.cfg.xml
# ADD run.sh /run.sh

# Install Oracle Java 7
RUN eatmydata -- apt-get install -yq python-software-properties && add-apt-repository ppa:webupd8team/java -y && apt-get update -y
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN eatmydata -- apt-get install -yq oracle-java7-installer

# PostgreSQL Client
RUN eatmydata -- apt-get install -yq postgresql-client

# VCS tools
RUN eatmydata -- apt-get install -yq git subversion

# XML Parser
RUN eatmydata -- apt-get install -yq xmlstarlet

# Expose web and agent ports
EXPOSE 8085
EXPOSE 54663

# Run supervisord
CMD ["/start/supervisord"]
