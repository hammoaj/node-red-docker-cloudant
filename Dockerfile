FROM nodered/node-red-dev:test-12

RUN npm install --unsafe-perm --no-update-notifier --only=production @cloudant/cloudant

COPY *.js ./
COPY defaults defaults/
COPY nodes nodes/
COPY public public/

CMD ["--settings" ,"./docker-settings.js"]
