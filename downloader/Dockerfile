FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates unzip \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /work

COPY hytale-downloader-linux-amd64 /usr/local/bin/hytale-downloader
RUN chmod +x /usr/local/bin/hytale-downloader

COPY download.sh /usr/local/bin/download.sh
RUN chmod +x /usr/local/bin/download.sh

ENTRYPOINT ["/usr/local/bin/download.sh"]
