# scraping_dockside
an example scrapy application with docker configuration management

clone this repo and run to observe an integration between this python project and a container built to provide the necessary infrastructure to run the app.

## usage with docker
The full process required to run this project should be accomplished with the following two instructions.

Install docker compose https://docs.docker.com/compose/install/

run `docker-compose up`

## Docker notes
This directory represents the docker build context root directory

the `.dockerignore` file excludes files which might otherwise be copied

I've included an environment variable "version" to control the version label within the image.  I'd hope that this is kept in line with the tag used to build the Dockerfile

