#!/bin/bash
set -o xtrace

# Log in to the Bintray Docker registry
docker login -u $BINTRAY_USER -p $BINTRAY_API_KEY -e $BINTRAY_EMAIL psbrandt-docker-openmrs-refapp-debian.bintray.io

# Tag the tomcat image
docker tag `docker images -q openmrsrefappdocker_openmrs-refapp-tomcat` psbrandt-docker-openmrs-refapp-debian.bintray.io/tomcat:$TRAVIS_TAG

# Push the tomcat image
docker push psbrandt-docker-openmrs-refapp-debian.bintray.io/tomcat:$TRAVIS_TAG

# Tag the mysql image
docker tag `docker images -q openmrsrefappdocker_openmrs-refapp-mysql` psbrandt-docker-openmrs-refapp-debian.bintray.io/mysql:$TRAVIS_TAG

# Push the mysql image
docker push psbrandt-docker-openmrs-refapp-debian.bintray.io/mysql:$TRAVIS_TAG
