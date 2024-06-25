# A simple flask application which can be dockerized

Disclaimer: This project was tested using Windows Subsystems for Linux running Ubuntu 22.04.3 LTS

This repo contains 3 versions of a flask project `version1`- a basic hello world app, `version2` - a basic "Hello {name}" app in CloudNation branding colors and `version3` - a broken version of the application.


## Level 1 - Build locally

Create a new python virtual environment in this folder:

`python3 -m venv .venv`

Activate the virtual environment:

`source ./.venv/bin/activate`

(when done working with this code; run `deactivate` to deactivate your virtual environment)

Install the requirements using pip

`pip install -r requirements.txt`

Check out a version of the code

`git checkout ${branch}`. where `${branch}` can be `version1` `version2` or `version3`

Run the code:

`flask --app main.py run`

Open your browser and go to `localhost:5000` to see the result.

## Level 2 - Containerize

Check out a version of the code using `git checkout ${branch}`. where `${branch}` can be `version1` `version2` or `version3`

Build your application using `docker build -t flask-test:${branch}`. where `${branch}` can be `version1` `version2` or `version3`

See if your image is built using `docker container ls -a | grep flask-test`

Run your image using 

`docker run -p 8080:5000 flask-test:${branch}`

Open your browser and go to `localhost:8080` to see the result

Note that you are now port forwarding your application using docker. Try to open a new terminal session and run

`docker run -p 8081:5000 flask-test:${branch}` using another version and see that you can now run 2 containers at the same time

## Level 3 - Push to a container registry

Prerequisite: A azure container registry

See the `acr_push.sh` file for an automated script

Build a new version of your container registry using the command

`docker build . -t ${containerRegistryName}.azurecr.io/flask-test:${branch}`

Push the container to a container registry using

`Docker push {containerRegistryName}.azurecr.io/flask-test:${branch}`

Go to the azure portal and see if your docker container has been uploaded.
