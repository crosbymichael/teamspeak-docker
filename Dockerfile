FROM debian:jessie

RUN apt-get update && apt-get install -y mysql-common 

ADD http://dl.4players.de/ts/releases/3.0.10.3/teamspeak3-server_linux-amd64-3.0.10.3.tar.gz /
ADD http://archive.debian.org/debian/pool/main/m/mysql-dfsg-5.0/libmysqlclient15off_5.0.51a-24+lenny5_amd64.deb /tmp/

RUN dpkg -i /tmp/libmysqlclient15off_5.0.51a-24+lenny5_amd64.deb

RUN tar -zxf teamspeak3-server_linux-amd64-3.0.10.3.tar.gz && \
    mv /teamspeak3-server_linux-amd64 /teamspeak && \
    chown -R daemon:daemon /teamspeak

WORKDIR /teamspeak
EXPOSE 9987/udp
ENV LD_LIBRARY_PATH .
USER daemon

ENTRYPOINT ["./ts3server_linux_amd64"]
