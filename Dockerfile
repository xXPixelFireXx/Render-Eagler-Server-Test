FROM eclipse-temurin:17-jre-alpine

# Install required system dependencies
RUN apk add --no-cache curl jq bash

WORKDIR /net

# Environment variables
ENV PORT=8080
ENV EULA=true

# Create server directory
RUN mkdir -p /net/server

# Download the EaglerXBungee server jar
RUN curl -L -o server.jar https://github.com/lax1dude/eaglercraftx-1.8/releases/download/v1.0.0/EaglerXBungee.jar

# Pre-accept the Minecraft EULA
RUN echo "eula=true" > eula.txt

# Copy and configure the startup script
COPY entrypoint.sh /net/entrypoint.sh
RUN chmod +x /net/entrypoint.sh

EXPOSE $PORT

ENTRYPOINT ["/net/entrypoint.sh"]
