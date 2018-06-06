FROM nodered/node-red-docker

USER root
RUN npm install -g node-red-admin

USER root

COPY nodered-wrapper /usr/src/node-red/ 
RUN chmod +x /usr/src/node-red/nodered-wrapper

USER node-red

COPY settings.js /data/

ENTRYPOINT ["/usr/src/node-red/nodered-wrapper"]
CMD ["npm", "start", "--", "--userDir", "/data"]
