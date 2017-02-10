## README

Notes for building Docker image for use with wercker for STA521 at Duke

The Dockerfile specifies which programs and packages are installed.  Add additional packages as needed

### build image

`> docker  build -t  predictive-modelling .`

### find docker image id

`> docker images`

### tag the image

`> docker tag [image id]  merliseclyde/predictive-modelling:latest`

`docker images`

### push

`> docker login`

`> docker push merliseclyde/predictive-modeling
