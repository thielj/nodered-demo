FROM nodered/node-red:latest-18-minimal

WORKDIR /data
COPY package.json flows.json /data/

RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production

WORKDIR /usr/src/node-red
#COPY settings.js /data/
