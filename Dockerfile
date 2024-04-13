FROM nodered/node-red:latest-18-minimal

# Override default files
WORKDIR /data
COPY package.json flows.json flows_cred.json /data/

# Install packages
ENV NODE_ENV production
RUN npm install --unsafe-perm --no-update-notifier --no-audit --no-fund --omit=dev

# Use default settings, but enable projects / git integration:
#COPY settings.js /data/
ENV NODE_RED_ENABLE_PROJECTS true

# Restore workdir the ENTRYPOINT expects this
WORKDIR /usr/src/node-red

LABEL org.opencontainers.image.description="A containerized Node-RED app demo"
