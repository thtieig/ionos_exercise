#!/bin/bash

IMAGENAME="nginxcustom"

echo -e "Make sure to run the following command before proceeding

~ docker login

Press any key to continue or CTRL+C to cancel...
"
read voidvar


# Create image
docker build -t  $IMAGENAME .

echo "To push to DockerHub, you need to run manually the following commands:

~ docker tag $IMAGENAME:latest <docker_username>/$IMAGENAME:latest

~ docker push <docker_username>/$IMAGENAME:latest

"