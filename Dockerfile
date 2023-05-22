# --- Build stage ---
FROM node:18 AS build
WORKDIR /usr/src/app
COPY package*.json yarn.lock ./
RUN yarn

# --- Production stage ---
FROM mcr.microsoft.com/devcontainers/javascript-node:18 AS production
WORKDIR /com.docker.devenvironments.code
COPY --from=build /usr/src/app/node_modules ./node_modules
COPY . .
CMD sleep infinity