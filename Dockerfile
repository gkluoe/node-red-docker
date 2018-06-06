FROM nodered/node-red-docker

USER root
RUN apt-get update 
RUN apt-get install -y vim-nox
RUN npm install -g node-red-admin

USER node-red

ADD settings.js /data/
COPY nodered-wrapper /usr/src/node-red/ 

USER root
RUN chmod +x /usr/src/node-red/nodered-wrapper
USER node-red

ENTRYPOINT ["/usr/src/node-red/nodered-wrapper"]
CMD ["npm", "start", "--", "--userDir", "/data"]
