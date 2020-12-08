FROM tomcat:7.0.107-jdk8-openjdk-slim-buster
RUN apt-get -y update && apt-get -y install lsof ncat

COPY . /app
WORKDIR /app

#Expose
EXPOSE 8080 

#CMD to run
CMD /bin/bash
