FROM cryptpad/cryptpad:version-2025.3.0

# Switch to the cryptpad user for remaining operations
USER cryptpad
WORKDIR /cryptpad/lib/plugins

# Clone the SSO plugin
RUN git clone https://github.com/cryptpad/sso/

# Revert working directory to the root of the cryptpad project
WORKDIR /cryptpad