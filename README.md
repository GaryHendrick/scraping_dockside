# scraping_dockside
an example scrapy application with docker configuration management

clone this repo and run to observe an integration between this python project 
and a container built to provide the necessary infrastructure to run the app.

## Settings
scrapy settings are set within a scrapy project's settings.py file.  These 
settings include the cache settings.
scraping.py is used to load the settings through get_project_settings

### http-cache middleware
the http-cache middleware is described in detail [here](https://doc.scrapy.org/en/latest/topics/downloader-middleware.html#module-scrapy.downloadermiddlewares.httpcache).
the settings.py file is used to store the desired settings.

## usage with docker
The docker image's entrypoint is set up to run an environmentals.sh script
the objective of which is to set up an appropriate environment to build
a scrapy project.

The full process required to run this project should be accomplished with the 
as follows.

Install docker compose https://docs.docker.com/compose/install/

run `docker-compose up`

at this point, the container has been appropriately configured, and has run
the script scraping.py which crawls according to scraping.py's configuration.

## Docker notes
This directory represents the docker build context root directory

the `.dockerignore` file excludes files which might otherwise be copied

I've included an environment variable "version" to control the version label 
within the image.  I'd hope that this is kept in line with the tag used to 
build the Dockerfile

