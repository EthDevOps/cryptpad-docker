FROM cryptpad/cryptpad:version-2026.5.1

# Node security release 2026-10-21: upstream image ships 24.16.0. Drop once upstream ships >= 24.22.1.
COPY --from=node:24.22.1-alpine /usr/local/bin/node /usr/local/bin/node
ENV NODE_VERSION=24.22.1

# Switch to the cryptpad user for remaining operations
USER cryptpad
WORKDIR /cryptpad/lib/plugins

# Clone the SSO plugin (pin to the version matching the CryptPad release, see upgrade notes)
RUN git clone --branch 0.6.0 --depth 1 https://github.com/cryptpad/sso/

# Revert working directory to the root of the cryptpad project
WORKDIR /cryptpad
