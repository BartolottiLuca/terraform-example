# Service Deployment Test

## A terraform challenge 

### Abstract

A new web-based service needs to be deployed into production such that it is accessible from the internet by the general public.
The service itself consists of a docker container containing the core service logic, a set of static html/css/js/etc files, and requires access to an existing hosted database.
The deployment is expected to handle at least 1000 concurrent users at launch, with the ability to scale up or down as required
by demand, and remain highly available in the face of server or network failures, or deliberate DoS. The service will need to be
updated from time-to-time, with minimal downtime.

### Challenge

Your challenge is two-fold:

1. Design appropriate deployment infrastructure for this service that meets the above requirements, including relevant deployment diagrams. The design may make use of any AWS/GCP services that you deem suitable for a production system.
   Please explicitly state any assumptions that you need to make as part of this design, as well as any expectations of the provided service container.
2. Implement this design using Terraform or an equivalent deployment technology. An example Dockerfile of an (extremely) simple API endpoint container is provided in the 'api' folder of this repository that you may use.
   Endpoints:
   / => Return 200 (Hello, thank you for taking time for the terraform challenge!)
   /greetings?name="NAME" => Return 200 (Hello, NAME)

### To test locally

Install npm and node (https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
npm install
node index.js from the /api directory

### Criteria

Assuming that you submit a viable solution, we are then first and foremost interested to see _how_ you solve the problem. That is our top criterion below:

1. Elegance/simplicity of your solution
2. Elegance/maintainability of your code
3. Design documentation + comments.
4. Git comments are clear and with a logic

### Bonus points

1. Cloud agnostic (can be deployed on GCP/AWS/Azure)
2. Country scaling (can be deployed on different countries)
3. Load Balancer (can accept connection from different countries and redirect to the closest service in that country)
