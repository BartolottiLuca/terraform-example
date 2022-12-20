const express = require("express");

const app = express();

app.get("/", async function (req, res) {
  res.send("Hello, Thank you for taking time for the MachineMax tech test!");
});

app.get("/greetings", async function (req, res) {
  let name = req.query["name"];

  if (!name) {
    return res.status(400).send(`Malformed data, please add your name`);
  }

  res.send(`Hello, ${name}!`);
});

try {
  app.listen(process.env.PORT || 80);
  console.info(`App is listening on port ${process.env.PORT || 80}`);
} catch (error) {
  console.error(`Unable to start. `, error);
}
