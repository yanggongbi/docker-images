FROM index.micai.asia/micai/postgres

ENV LC_ALL C.UTF-8

RUN curl -s http://micai.bitbucket.org/apt/install-auto-apt-sources.sh | /bin/sh

# Upgrade all packages and install postgres
RUN ulimit -n 1000; apt-get update -y && apt-get upgrade -y && apt-get clean

ADD pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
ADD postgresql.conf /etc/postgresql/9.3/main/postgresql.conf
RUN chown postgres:postgres /etc/postgresql/9.3/main/* &&\
    mkdir -p "/var/lib/postgresql/9.3/main" &&\
    chown postgres:postgres "/var/lib/postgresql/9.3/main"

ADD run_postgres /run_postgres

USER postgres
RUN /etc/init.d/postgresql start  &&\
    psql -c "create database website with encoding='UTF-8' template=template0;"

CMD ["/run_postgres"]

# VOLUME ["/var/log/postgresql", "/var/lib/postgresql"]

# MUST have this line, otherwise when you run "docker run --link"
# to link this container, variables like ${link_alias}_PORT_5432_TCP
# won't be set up.
EXPOSE 5432
