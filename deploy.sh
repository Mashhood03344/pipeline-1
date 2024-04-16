#!/bin/bash
# Path to your app directory
APP_DIR="/path/to/your/app"
# Port to expose your app on
PORT=3000

# Clone the repository
git clone https://github.com/your-username/your-repo.git $APP_DIR

# Dockerize the app
docker build -t your-app $APP_DIR
docker run -d -p $PORT:80 your-app

