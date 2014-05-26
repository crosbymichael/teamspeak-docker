FROM debian:jessie

ADD http://dl.4players.de/ts/releases/3.0.10.3/teamspeak3-server_linux-amd64-3.0.10.3.tar.gz /

RUN tar -zxf teamspeak3-server_linux-amd64-3.0.10.3.tar.gz && \
    mv /teamspeak3-server_linux-amd64 /teamspeak && \
    chown -R daemon:daemon /teamspeak

WORKDIR /teamspeak
EXPOSE 9987/udp
ENV LD_LIBRARY_PATH .
USER daemon

ENTRYPOINT ["./ts3server_linux_amd64"]
