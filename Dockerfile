FROM cryptpad/cryptpad:version-2026.2.2

# Switch to the cryptpad user for remaining operations
USER cryptpad
WORKDIR /cryptpad/lib/plugins

# Clone the SSO plugin
RUN git clone https://github.com/cryptpad/sso/

# Revert working directory to the root of the cryptpad project
WORKDIR /cryptpad

# Pre-install OnlyOffice assets during build to avoid timeout on startup
RUN ./install-onlyoffice.sh
