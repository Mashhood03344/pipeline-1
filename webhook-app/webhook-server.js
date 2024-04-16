const express = require('express');
const { exec } = require('child_process');

const app = express();

app.use(express.json());

app.post('/github', (req, res) => {
  const { ref } = req.body;

  // Check if the push event is for the main branch
  if (ref && ref === 'refs/heads/main') {
    // Call your deploy script here
    exec('sh "/home/mash-hood/DRIVE D/DEVOPS LEARNING/Programmer Force Tasks/Task 1/deploy1.sh"', (error, stdout, stderr) => {
      if (error) {
        console.error(`exec error: ${error}`);
        res.status(500).send('Error during deployment');
        return;
      }
      console.log(`stdout: ${stdout}`);
      console.error(`stderr: ${stderr}`);
      res.status(200).send('Webhook received');
    });
  } else {
    res.status(200).send('Webhook received, but no action taken');
  }
});

app.listen(3001, () => {
  console.log('Webhook server is running on port 3001');
});

