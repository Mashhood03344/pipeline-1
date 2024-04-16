This script first exposes your port 3000, then sets up the origin for the git to pull the code from, then pulls the code from the repo 

Stops and removes any running containers with the name deploy

Then removes any image with the name your-app

Then it dokcerizes the app by building an image of the code in server.js file named your-app and then runs the image in a newly created container called deploy
