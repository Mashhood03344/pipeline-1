#!/bin/bash

# Path to your app directory
APP_DIR="Add the path where you want to pull the code from github repo /path/deploy.sh"

# Port to expose your app on
PORT=3000

# Going to that directory
cd "$APP_DIR"  # Corrected to use the variable

# Setting the origin
git remote set-url origin "your repo complete url"

# Taking the pull from the repository
git pull origin main  # Corrected typo in 'origin'

# Stopping any running container with the name deploy 
docker stop deploy

# Removing any stopped container with the name deploy
docker rm deploy

# Removing the existing image 
docker rmi your-app

# Dockerize the app
docker build -t your-app "$APP_DIR"
docker run -d -p $PORT:3000 --name deploy your-app

