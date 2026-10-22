FROM cryptpad/cryptpad:version-2026.2.2

# Node security release 2026-10-21: upstream image ships 24.14.1. Drop once upstream ships >= 24.22.1.
COPY --from=node:24.22.1-alpine /usr/local/bin/node /usr/local/bin/node
ENV NODE_VERSION=24.22.1

# Switch to the cryptpad user for remaining operations
USER cryptpad
WORKDIR /cryptpad/lib/plugins

# Clone the SSO plugin
RUN git clone https://github.com/cryptpad/sso/

# Revert working directory to the root of the cryptpad project
WORKDIR /cryptpad
