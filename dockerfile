# build stage
FROM node:26 AS node-builder-stage
RUN mkdir build
WORKDIR /build
COPY package.json package-lock.json ./
RUN npm ci
COPY . .

# production stage
FROM alpine:3.23
RUN apk add --update nodejs
RUN addgroup -S node && adduser -S node -G node
USER node
RUN mkdir /home/node/code
WORKDIR /home/node/code
COPY --from=node-builder-stage --chown=node:node /build .
CMD ["node", "index.js"]
