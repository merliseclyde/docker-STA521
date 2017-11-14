FROM merliseclyde/jags:latest
MAINTAINER "Merlise Clyde" clyde@duke.edu

RUN apt-get update && . /etc/environment \
  && install2.r --repos 'https://cran.rstudio.com'  httr ISLR arm bestglm GGally caret xtable stargazer vcd boot BayesTree BART monomvn gbm randomForest smoothmest plotrix rjags R2jags  lars lasso2 glmnet tree mgcv xgboost \
  && installGithub.r \
     merliseclyde/BAS \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
## httr authentication uses this port
EXPOSE 1410
ENV HTTR_LOCALHOST 0.0.0.0
