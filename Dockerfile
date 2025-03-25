FROM cryptpad/cryptpad:version-2024.12.0

# Switch to the cryptpad user for remaining operations
USER cryptpad
WORKDIR /cryptpad/lib/plugins

# Clone the SSO plugin
RUN git clone https://github.com/cryptpad/sso/
