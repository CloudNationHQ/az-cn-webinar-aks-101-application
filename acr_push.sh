#!/bin/bash

# Function to get the current git branch name
get_current_branch() {
  git branch --show-current
}

# Function to get the repository name from the current directory
get_repo_name() {
  basename "$(git rev-parse --show-toplevel)"
}

# Prompt the user for the container registry name
read -p "Enter the container registry name: " registry_name

# Get the current git branch name
branch_name=$(get_current_branch)

# Get the repository name
repo_name="flask-test"

# Tag the Docker image
docker_tag="$registry_name.azurecr.io/$repo_name:$branch_name"
echo "Tagging the Docker image as $docker_tag"
docker build -t $docker_tag .

az acr login --name $registry_name

# Push the Docker image to the registry
echo "Pushing the Docker image to $registry_name"
docker push $docker_tag

echo "Docker image pushed to $docker_tag"
