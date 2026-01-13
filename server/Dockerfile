FROM eclipse-temurin:25-jre

# Create a non-root user (safer)
RUN useradd -m -u 10001 hytale

WORKDIR /opt/hytale

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Persistent data: worlds, logs, mods, configs
VOLUME ["/data"]

USER hytale

# Hytale uses QUIC over UDP on 5520
EXPOSE 5520/udp

ENTRYPOINT ["/entrypoint.sh"]
