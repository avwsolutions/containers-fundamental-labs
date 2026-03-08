FROM ubuntu AS base

LABEL release.vendor="example.avwsolutions.nl"
LABEL release.version="v0.9.2"
COPY license.txt .

ENV datadir "/data"

RUN mkdir ${datadir}
ADD data data
WORKDIR ${datadir}

RUN apt-get update && apt-get install -y ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd -r searchonly && useradd --no-log-init -r -g searchonly searchonly

COPY docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod +x /usr/local/bin/docker_entrypoint.sh

USER searchonly

# CMD ["/usr/local/bin/docker_entrypoint.sh", "grep", "term"]

ENTRYPOINT ["/usr/local/bin/docker_entrypoint.sh"]

VOLUME [ "/data" ]
