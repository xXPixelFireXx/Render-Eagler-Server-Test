FROM eclipse-temurin:17-jre-alpine

# Install curl, jq, and bash
RUN apk add --no-cache curl jq bash

WORKDIR /net

ENV PORT=8080

# Create server structure
RUN mkdir -p /net/plugins

# Download Waterfall (BungeeCord proxy)
RUN curl -L -o /net/server.jar https://api.papermc.io/v2/projects/waterfall/versions/1.20/builds/556/downloads/waterfall-1.20-556.jar

# Download the unified EaglerXServer plugin directly into the plugins folder
RUN curl -L -o /net/plugins/EaglerXServer.jar https://github.com/lax1dude/eaglerxserver/releases/download/v1.0.0/EaglerXServer.jar

COPY entrypoint.sh /net/entrypoint.sh
RUN chmod +x /net/entrypoint.sh

EXPOSE $PORT

ENTRYPOINT ["/net/entrypoint.sh"]
