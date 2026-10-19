FROM node:26-alpine3.23

USER node

WORKDIR /home/node/code

COPY --chown=node package.json package-lock.json ./

RUN npm ci

COPY --chown=node:node . .

CMD ["node", "index.js"]
