FROM rocker/verse
MAINTAINER "Merlise Clyde" clyde@duke.edu

RUN apt-get update \
  && apt-get install -y --no-install-recommends software-properties-common\
  && wget --quiet  http://http.debian.net/debian/pool/main/j/jags/jags_3.4.0.orig.tar.gz \
  && tar xvf jags_3.4.0.orig.tar.gz \
  && cd JAGS-3.4.0 \
  && ./configure \
  && make install \
  && cd .. \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
##
## Install the tidyverse package, RStudio pkg dev (and some close friends). \
  && install2.r \
   -r 'https://cran.rstudio.com' \
   --dep TRUE  \
   ISLR arm GGally caret \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

## httr authentication uses this port
EXPOSE 1410
ENV HTTR_LOCALHOST 0.0.0.0
