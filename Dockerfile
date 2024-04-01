FROM debian:stable-slim

LABEL maintainer "Jim Clausing, jclausing@isc.sans.edu"
LABEL version="takajo 2.5.0"
LABEL description="Run takajo in a docker container"

WORKDIR /app

RUN apt update && \
    apt install wget unzip libpcre3 libcurl4 -y && \
    apt clean && \
    wget https://github.com/Yamato-Security/takajo/releases/download/v2.5.0/takajo-2.5.0-linux.zip && \
    unzip takajo*.zip && \
    chmod a+x /app/takajo && \
    rm -vf *.tar.gz *.zip

ENTRYPOINT ["/app/takajo"]
CMD ["help"]
