FROM rocker/verse:latest
MAINTAINER "Merlise Clyde" clyde@duke.edu

RUN apt-get update && apt-get -y install --no-install-recommends \
  libopenblas-dev \
  liblapack-dev \
  librsvg2-dev \
  libudunits2-dev \
  libsndfile1-dev \
  libfftw3-dev \
  libv8-3.14-dev \
  libxslt-dev \
  ## install jags from source, jessie version too old 
  && wget https://sourceforge.net/projects/mcmc-jags/files/JAGS/4.x/Source/JAGS-4.2.0.tar.gz -O jags.tar.gz \
  && tar -xf jags.tar.gz \
  && cd JAGS* && ./configure && make && make install \
  && cd / && rm -rf jags.tar.gz JAGS* \
  ## Install R packages from fixed repo
  && . /etc/environment \
  && install2.r --error -r $MRAN \
     FastGP \
     nimble \
     rjags \
     ISLR \                                                                        arm \
     GGally \
     caret \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

## httr authentication uses this port
EXPOSE 1410
ENV HTTR_LOCALHOST 0.0.0.0
