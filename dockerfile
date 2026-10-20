FROM alpine:3.23

RUN apk add --update nodejs npm

RUN addgroup -S node && adduser -S node -G node

USER node

WORKDIR /home/node/code

COPY --chown=node package.json package-lock.json ./

RUN npm ci

COPY --chown=node:node . .

CMD ["node", "index.js"]
