# Minecraft Server on Railway.app (Fabric + Modrinth)

This repository contains configuration files to run a 24/7 modded Minecraft server on Railway.app using Fabric.

## Setup Instructions for Railway

1. Create a Railway.app account at https://railway.app
2. Fork this repository to your GitHub account
3. In Railway dashboard:
   - Click "New Project"
   - Select "Deploy from GitHub repo"
   - Choose your forked repository
   - Click "Deploy Now"

Railway will automatically:
- Build the Docker container
- Set up the necessary ports
- Start your Minecraft server

## Adding Mods from Modrinth

1. Create a `mods` folder in your repository if it doesn't exist
2. Download mods from Modrinth:
   - Go to https://modrinth.com/mods
   - Make sure to select "Fabric" as the mod loader
   - Select Minecraft version 1.20.4
   - Download the .jar files for the mods you want
3. Place the downloaded mod .jar files in the `mods` folder
4. Commit and push your changes to GitHub
5. Railway will automatically redeploy your server

## Important Notes for Mods

- Make sure all mods are compatible with Fabric
- Check that mods are for Minecraft version 1.20.4
- Players will need to install the same mods on their client
- Some recommended mods:
  - Fabric API (required for most mods)
  - Lithium (performance improvements)
  - Starlight (lighting engine optimization)

## Configuration

- The server uses 2GB of RAM
- World data persists between restarts
- The server runs on port 25565 (default Minecraft port)
- Server properties can be modified in `server.properties`
- Mod configs can be added to the `config` folder

## Connecting to the Server

1. Once deployed, Railway will provide you with a domain
2. Use this domain or IP to connect to your server
3. Make sure to install the same mods on your client

## Free Tier Limits

Railway's free tier includes:
- 500 hours of runtime per month
- 500MB RAM (we'll optimize the server for this)
- Shared CPU
- 1GB disk space

The server will automatically stop when you reach the free tier limits.
