## README

Notes for building Docker image for use with wercker for STA521 at Duke

The Dockerfile specifies which programs and packages are installed.  Add additional packages as needed

###  pull base image 
###  
 this is built from the `rocker-bayesian` docker image that adds the jags executible to the rocker/verse image.

`> docker pull  mavelli/rocker-bayesian`

### build image

`> docker  build -t  predictive-modelling .`

### find docker image id

`> docker images`

### tag the image

`> docker tag [image id]  merliseclyde/predictive-modeling:latest`

`docker images`

### run interactively



`> docker run -it <Image ID> bash`


Check to see that packages are there.

### push

`> docker login`

`> docker push merliseclyde/predictive-modeling`


