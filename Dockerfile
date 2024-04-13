FROM nodered/node-red:latest-18-minimal

WORKDIR /data
COPY package.json settingsnodered/node-red:latest-18-minimal.js flows.json /data
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production
