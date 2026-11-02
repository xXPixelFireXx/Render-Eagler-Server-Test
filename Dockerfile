FROM eclipse-temurin:17-jre-alpine

# Install curl and jq to fetch dependencies
RUN apk add --no-舆-cache curl jq bash

WORKDIR /net

# Environment variables
ENV PORT=8080
ENV EULA=true

# Create directory structure
RUN mkdir -p /net/server

# Download PaperMC (1.8.8 / 1.12.2 / 1.20 compatible) or EaglerXBungee Bundle
# We'll set up a lightweight pre-configured Eaglercraft standalone server executable
RUN curl -L -o server.jar https://github.com/lax1dude/eaglercraftx-1.8/releases/download/v1.0.0/EaglerXBungee.jar || \
    curl -L -o server.jar https://papermc.io/api/v2/projects/paper/versions/1.8.8/builds/443/downloads/paper-1.8.8-443.jar

# EULA acceptance
RUN echo "eula=true" > eula.txt

# Copy start script
COPY entrypoint.sh /net/entrypoint.sh
RUN chmod +x /net/entrypoint.sh

EXPOSE $PORT

ENTRYPOINT ["/net/entrypoint.sh"]
