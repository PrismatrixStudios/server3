FROM openjdk:17-slim

WORKDIR /minecraft

# Install required packages
RUN apt-get update && \
    apt-get install -y wget curl netcat-traditional unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download Fabric installer and set up server
RUN wget https://meta.fabricmc.net/v2/versions/loader/1.20.4/0.15.6/1.0.0/server/jar -O fabric-server-launcher.jar

# Create mods directory
RUN mkdir -p mods

# Copy server properties
COPY server.properties .

# Create a directory for mod configuration
RUN mkdir -p config

# Accept EULA
RUN echo "eula=true" > eula.txt

# Copy mods from local mods directory
COPY mods/* mods/

# Expose minecraft server port
EXPOSE 25565

# Optimize for Railway's free tier
ENV JAVA_OPTS="-Xmx450M -Xms450M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1"

# Start the server with optimized settings
CMD ["sh", "-c", "java ${JAVA_OPTS} -jar fabric-server-launcher.jar nogui"]
