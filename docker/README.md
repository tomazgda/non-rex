# Resources for possible future use of Docker
*Just a contingency*

## Github Actions 

*build-docker.yaml* instructs GitHub to build the Docker image from *Dockerfile* and push it to Docker Hub. For this to work, the GitHub repo must have secretes marked DOCKER_HUB_USERNAME and DOCKER_HUB_TOKEN, with values accordingly. The destination on Docker Hub must be specified also.
