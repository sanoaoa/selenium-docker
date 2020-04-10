FROM openjdk:8u191-jre-alpine3.9

RUN apk add curl jq

# WorkSpace
WORKDIR /usr/share/udemy

#Add all .jar to target from host 
ADD target/selenium-docker.jar         selenium-docker.jar
ADD target/selenium-docker-tests.jar   selenium-docker-tests.jar
ADD target/libs                        libs

#Add tst suites testng.xml
ADD testng.xml    testng.xml


#ADD Health script healthcheck.sh
ADD healthcheck.sh         healthcheck.sh

#COPY any other dependency like .JSON, .CSV, .XLS, .pdf, .properties etc

#Define Entry point with variables (VARIABLES AS INPUT FROM UESR) as
#BROWSER
#HUB_HOST
#MODULES

ENTRYPOINT sh healthcheck.sh