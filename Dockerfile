FROM nodered/node-red-dev:test-12

COPY package.json ./

# RUN npm install --unsafe-perm --no-update-notifier --only=production @cloudant/cloudant passport-idaas-openidconnect
RUN npm install --unsafe-perm --no-update-notifier --only=production


COPY *.js ./
COPY defaults defaults/
COPY nodes nodes/
COPY public public/

COPY certs /home/vcap/app/

#ENTRYPOINT ["sh"]
CMD ["--settings" ,"./cirrus-settings.js"]
