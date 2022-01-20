docker compose up
Docker Compose is a tool in the Docker platform that is used for defining and running multi-container applications. For example, if your application follows the microservices architecture, then Compose is the best tool to dockerize and run each microservice in isolation and in separate containers.
Compose takes a YAML file that defines and configures settings related to each application service. You can then start and stop all the services of the application with a single command.
Our first config action is running the commands defined in the Dockerfile. We use build to accomplish this. We can pass the relative path to the Dockerfile using context.
In the service configuration and inside the application code, the Node application uses environmental variables defined inside the .env file. Therefore, we should specify its path under env_file.
Docker Compose uses the command we provide, npm start, to start the Node application.
Web service defines two volumes to persist data, one for the project directory and one for node_modules directory that’s created when Docker runs npm install.
Then, we use ports to map the public local port to the internal docker port. With this mapping, the local port should be used to access the application from the outside. Meanwhile, the Node server listens to the Docker port. Instead of directly providing port numbers, we provide a reference to the value stored in .env to make the code easily maintainable.
depends_on option is used to tell Docker Compose whether the current service depends on any other service defined in the Compose file. Since our Node app depends on the MySQL database to store and retrieve data we need to specify this in the configuration.
