FROM icr.io/appcafe/open-liberty:full-java11-openj9-ubi

ARG VERSION=1.0
ARG REVISION=SNAPSHOT

LABEL \
  org.opencontainers.image.authors="Anusree" \
  org.opencontainers.image.vendor="Open Liberty" \
  org.opencontainers.image.url="local" \
  org.opencontainers.image.source="https://github.com/anusree-mmlab/samplemicroprofile" \
  org.opencontainers.image.version="$VERSION" \
  org.opencontainers.image.revision="$REVISION" \
  vendor="Open Liberty" \
  name="demo" \
  version="$VERSION-$REVISION" \
  summary="Sample app" \
  description="Sample app image"

COPY --chown=1001:0 src/main/liberty/config /config/

COPY --chown=1001:0 target/demo.war /config/apps

COPY --chown=1001:0 target/demo.jar /config/apps

RUN configure.sh