import socket
import time
import requests
from mcstatus import JavaServer
import os

def ping_railway():
    # Get the Railway URL from environment variable or use default
    url = os.getenv('RAILWAY_STATIC_URL', 'your-railway-url')
    try:
        requests.get(f'https://{url}')
        print(f"Pinged {url}")
    except:
        print("Railway ping failed")

def ping_minecraft(host='localhost', port=25565):
    try:
        server = JavaServer(host, port)
        status = server.status()
        print(f"Server latency: {status.latency}ms")
        print(f"Players online: {status.players.online}/{status.players.max}")
        return True
    except:
        print("Minecraft ping failed")
        return False

if __name__ == "__main__":
    print("Starting ping service...")
    while True:
        ping_railway()
        ping_minecraft()
        # Wait 10 minutes before next ping
        time.sleep(600)
