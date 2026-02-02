FROM debian:bookworm-slim

LABEL maintainer="Jim Clausing, jclausing@isc.sans.edu"
LABEL version="takajo 2.15.1"
LABEL description="Run takajo in a docker container"

WORKDIR /app

RUN apt update && \
    apt install wget unzip libpcre3 libsqlite3-0 libcurl4 -y && \
    apt clean && \
    wget https://github.com/Yamato-Security/takajo/releases/download/v2.15.1/takajo-2.15.1-lin-x64-gnu.zip && \
    unzip takajo*.zip && \
    ln takajo-*-gnu takajo && \
    chmod a+x /app/takajo && \
    rm -vf *.tar.gz *.zip

ENTRYPOINT ["/app/takajo"]
CMD ["--help"]
