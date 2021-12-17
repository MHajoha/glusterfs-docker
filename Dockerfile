FROM debian:buster

RUN apt-get update -y \
    && apt-get install -y gnupg ca-certificates

COPY gluster.list /etc/apt/sources.list.d/
COPY gluster.asc /etc/apt/trusted.gpg.d/

RUN apt-get update -y \
    && apt-get install -y glusterfs-server \
    && rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /
WORKDIR /var/lib/glusterd
ENTRYPOINT ["/docker-entrypoint.sh"]

ENV LOG_LEVEL=INFO

VOLUME /var/lib/glusterd
EXPOSE 24007
EXPOSE 49152 49153 49154 49155 49156 49157 49158 49159
EXPOSE 111/tcp 111/udp
EXPOSE 2049
