#To set up a continuous integration pipeline for deploying a simple app from a GitHub repository, follow these steps:

    Download Files: Get the server.js and Dockerfile from the main branch of your GitHub repository.

    Initialize Package: Run npm init -y to create a package.json file and then run npm install to install all required packages. Do the same for webhook-server.js in the webhook-server branch.

    Separate Apps: Since server.js and webhook-server.js are separate Node.js apps, place them in different directories.

    Get Deployment Script: Download deploy.sh from the script branch of your repository.

    Set Up Webhook Server: Run webhook-server.js on your local machine on port 3001. You can use nodemon for this purpose. You can also start the app with the command node webhook-server.js but I recommend using nodemon.

    Use Serveo: Go to serveo.net and copy a URL similar to ssh -R 80:localhost:3000 serveo.net.

    Note: In the command ssh -R 80:localhost:3000 serveo.net instead of localhost:3000 write localhost:3001 because you will need port 3000 to run your app in server.js file so the command will become sh -R 80:localhost:3001 serveo.net

    Run this URL in your terminal (Ubuntu or PowerShell on Windows). This allows you to connect your local machine's port 3001 with the GitHub webhook with a url like this orwarding HTTP traffic from https://7ea506560d5f987169f954ab89e7f5e1.serveo.net (The URL https://7ea506560d5f987169f954ab89e7f5e1.serveo.net is an example URL. You should use the URL provided by Serveo when they set up the tunnel.)

    Configure GitHub Webhook: Copy the URL provided by Serveo (e.g., https://7ea506560d5f987169f954ab89e7f5e1.serveo.net) and paste it into the Payload URL field under Webhooks settings in your GitHub repository. Append /github to the end of the URL https://7ea506560d5f987169f954ab89e7f5e1.serveo.net/github

    Configure Webhook Settings: Select application/json under the Content Type selection. Check the checkbox for "Just the push event" under "Which events would you like to trigger this webhook?". Press the "Add webhook" button to save your webhook settings.

Now, whenever you push code to your selected GitHub repository, it will be automatically pulled and dockerized on your local machine, thanks to the configured webhook. Remember to clone your repository to the path specified in deploy.sh before running the script in deploy.sh.
