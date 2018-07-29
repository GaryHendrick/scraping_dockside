#!/bin/sh
echo "Setting up the environmentals for the scraping dockside application"
echo "The following environmental variables are carried over by docker"
echo "The UID of this user is ${UID} the UID of the user from the host is ${USER_ID}"

if [ ! $PROJECT_NAME ] ; then
        PROJECT_NAME=exemplar
fi

echo "Working with Project ${PROJECT_NAME}"

if [ ! -d $PROJECT_NAME ] ; then
	echo "For lack of $PROJECT_NAME directory, creating project $PROJECT_NAME"
        scrapy startproject $PROJECT_NAME
fi

