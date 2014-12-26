FROM index.micai.asia/micai/ubuntu 

# No prompts during upgrade
ENV DEBIAN_FRONTEND noninteractive

RUN curl -s http://micai.bitbucket.org/apt/install-auto-apt-sources.sh | /bin/sh

# Upgrade all packages
RUN ulimit -n 1000; apt-get update -y && apt-get upgrade -y && apt-get install -y nginx

VOLUME ["/var/log/nginx", "/nginx/ssl"]

# Allow the app to detect docker
ENV DOCKER 1

# ADD SSL cert & key
ADD micai.asia-bundle.crt	/nginx/ssl/micai.asia.crt
ADD micai.asia.key		/nginx/ssl/micai.asia.key
ADD nginx.conf.in		/etc/nginx/nginx.conf.in
ADD run.sh			/run.sh

CMD /run.sh
