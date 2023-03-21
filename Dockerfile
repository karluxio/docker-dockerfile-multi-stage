# stage 1: deps: dev dependencies
FROM node:19.2-alpine3.17 as deps
# cd /app
WORKDIR /app
# dest /app
COPY package.json ./
# install dependencies
RUN npm install

# =========================================

# stage 2: builder: build and tests
FROM node:19.2-alpine3.17 as builder
WORKDIR /app
# pull and copy node_modules from stage named dependencies to /app/node_modules
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run test
# for nestjs an others
# RUN npm run build

# =========================================

# stage 3: prod-deps: production dependencies
FROM node:19.2-alpine3.17 as prod-deps
WORKDIR /app
COPY package.json ./
RUN npm install --prod

# =========================================

# stage 4: runner: run app
FROM node:19.2-alpine3.17 as runner
WORKDIR /app
COPY --from=prod-deps /app/node_modules ./node_modules
COPY app.js ./
COPY tasks ./tasks
CMD [ "node", "app.js" ]

