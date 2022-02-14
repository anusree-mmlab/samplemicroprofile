FROM icr.io/appcafe/open-liberty:kernel-slim-java8-openj9-ubi

# Add Liberty server configuration including all necessary features
COPY --chown=1001:0  src/main/liberty/config/server.xml /config/

# Modify feature repository (optional)
# A sample is in the 'Getting Required Features' section below
#COPY --chown=1001:0 featureUtility.properties /opt/ol/wlp/etc/

# This script will add the requested XML snippets to enable Liberty features and grow image to be fit-for-purpose using featureUtility.
# Only available in 'kernel-slim'. The 'full' tag already includes all features for convenience.
RUN features.sh

# Add interim fixes (optional)
#COPY --chown=1001:0  interim-fixes /opt/ol/fixes/

# Add app
COPY --chown=1001:0  target/demo.war /config/apps/
COPY --chown=1001:0  target/demo.jar /config/apps/

# This script will add the requested server configurations, apply any interim fixes and populate caches to optimize runtime
RUN configure.sh
