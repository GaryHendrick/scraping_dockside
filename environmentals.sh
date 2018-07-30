#!/bin/sh
echo "Setting up the environmentals for the scraping dockside application"

if [ ! $PROJECT_NAME ] ; then
        PROJECT_NAME=exemplar
fi

echo "Working with Project ${PROJECT_NAME}"

if [ ! -d $PROJECT_NAME ] ; then
	echo "For lack of $PROJECT_NAME directory, creating project $PROJECT_NAME"
        scrapy startproject $PROJECT_NAME
fi

