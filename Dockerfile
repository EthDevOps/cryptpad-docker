FROM cryptpad/cryptpad:version-2026.2.2

# Switch to the cryptpad user for remaining operations
USER cryptpad
WORKDIR /cryptpad/lib/plugins

# Clone the SSO plugin
RUN git clone https://github.com/cryptpad/sso/

# Revert working directory to the root of the cryptpad project
WORKDIR /cryptpad

# Pre-install OnlyOffice assets during build and replace script with no-op
# to prevent the entrypoint from re-running the lengthy install at startup
RUN ./install-onlyoffice.sh --accept-license --trust-repository \
 && echo '#!/bin/bash' > ./install-onlyoffice.sh
