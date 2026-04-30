FROM debian:bookworm-slim

LABEL maintainer="Jim Clausing, jclausing@isc.sans.edu"
LABEL version="takajo 2.16.0"
LABEL description="Run takajo in a docker container"

WORKDIR /app

RUN apt update && \
    apt install wget unzip libpcre3 libsqlite3-0 libcurl4 -y && \
    apt clean && \
    wget https://github.com/duckdb/duckdb/releases/download/v1.5.1/libduckdb-linux-amd64.zip && \
    unzip libduckdb-linux-amd64.zip -d libduckdb && \
    mv libduckdb/libduckdb.so /usr/local/lib/ && \
    ldconfig && \
    rm -rvf libduckdb* && \
    wget https://github.com/Yamato-Security/takajo/releases/download/v2.16.0/takajo-2.16.0-lin-x64-gnu.zip && \
    unzip takajo*.zip && \
    ln takajo-*-gnu takajo && \
    chmod a+x /app/takajo && \
    rm -vf *.tar.gz *.zip

ENTRYPOINT ["/app/takajo"]
CMD ["--help"]
