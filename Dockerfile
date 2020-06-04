FROM nodered/node-red

COPY package.json ./

RUN npm install --unsafe-perm --no-update-notifier --only=production

COPY *.js ./
COPY defaults defaults/
COPY nodes nodes/
COPY public public/

CMD ["--settings" ,"./docker-settings.js"]
