FROM ubuntu:latest
RUN apt-get -y update
RUN apt-get install -y openjdk-17-jre
RUN java -version
WORKDIR me
COPY plantinput.uml /me/plantinput.uml
RUN curl -L https://github.com/plantuml/plantuml/releases/download/v1.2024.7/plantuml-1.2024.7.jar --output ./plantuml.jar
