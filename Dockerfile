FROM node:20-alpine

# setup WORK_DIR then copy files for installation
ARG WORK_DIR=/app
RUN mkdir -p ${WORK_DIR}
COPY . ${WORK_DIR}/
WORKDIR ${WORK_DIR}

RUN npm install && npm run build

EXPOSE ${APP_PORT}
EXPOSE ${MS_APP_PORT}

ENTRYPOINT [ "npm", "run", "start:prod" ]
