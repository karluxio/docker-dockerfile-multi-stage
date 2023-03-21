# linux with folders like /app /lib /usr
# FROM node:19.2-alpine

# with a specific platform
# FROM --platform=linux/amd64 node:19.2-alpine

# with all platforms using docker buildx build --platform linux/amd64,linux/arm64, etc.
# FROM --platform=$BUILDPLATFORM node:19.2-alpine3.17
# Or
# docker buildx build --platform linux/amd64,linux/arm64, etc.
FROM node:19.2-alpine3.17

# cd /app
WORKDIR /app

COPY package.json ./

# RUN ==> Run commands at building time
# install dependencies
RUN npm install

COPY . .

# run tests
RUN npm run test

# remove unnecessary files and directories in PROD
RUN rm -rf tests && rm -rf node_modules

# install dependencies only for production
RUN npm install --prod

# Run commands at running time
CMD [ "node", "app.js" ]

