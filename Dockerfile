# https://nodejs.org/en/docs/guides/nodejs-docker-webapp/
# https://medium.com/@VincentSchoener/development-of-nodejs-application-with-docker-and-typescript-part-2-4dd51c1e7766
#
# Builder stage.
# This state compile our TypeScript to get the JavaScript code
#
#FROM node:15.12.0 AS builder

#WORKDIR /usr/src/app

#COPY package*.json ./
#COPY webpack*.js ./
#COPY .babelrc ./
#COPY ./src ./src
#COPY ./public ./public
#RUN npm ci --quiet && npm run build

#
# Production stage.
# This state compile get back the JavaScript code from builder stage
# It will also install the production package only
#
FROM node:15.12.0-alpine

WORKDIR /app

# environment variables
ENV PORT=80

COPY . .
#COPY ./src ./build/src
#RUN npm ci --quiet --only=production

# We just need the build to execute the command
#COPY --from=builder /usr/src/app ./build

#CMD [ "node" "/build/src/server/index.js" ]
CMD [ "node", "server.js" ]