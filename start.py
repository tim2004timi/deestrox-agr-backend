#!/usr/bin/env python3
"""
Startup script for Deestrox Message Aggregator Backend
"""

import uvicorn
import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

if __name__ == "__main__":
    # Get configuration from environment or use defaults
    host = os.getenv("HOST", "0.0.0.0")
    port = int(os.getenv("PORT", "3001"))
    reload = os.getenv("RELOAD", "false").lower() == "true"
    
    print(f"🚀 Starting Deestrox Message Aggregator Backend...")
    print(f"📍 Host: {host}")
    print(f"🔌 Port: {port}")
    print(f"🔄 Reload: {reload}")
    print(f"🌐 API URL: http://{host}:{port}")
    print(f"📡 WebSocket URL: ws://{host}:{port}")
    
    # Start the server
    uvicorn.run(
        "main:app",
        host=host,
        port=port,
        reload=reload,
        log_level="info"
    )
