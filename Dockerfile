FROM cryptpad/cryptpad:version-2026.10.0

# Switch to the cryptpad user for remaining operations
USER cryptpad
WORKDIR /cryptpad/lib/plugins

# Clone the SSO plugin (pin to the version matching the CryptPad release, see upgrade notes)
RUN git clone --branch 1.0.0 --depth 1 https://github.com/cryptpad/sso/

# 2026.10 no longer ships the plugin's deps (openid-client, node-saml) in the root package
WORKDIR /cryptpad/lib/plugins/sso
RUN npm ci --omit=dev

# Revert working directory to the root of the cryptpad project
WORKDIR /cryptpad
