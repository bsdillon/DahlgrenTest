FROM openjdk:7
COPY . HelloWorldTest
WORKDIR HelloWorldTest
CMD javac HelloWorld.java
CMD pwd
CMD ls
ADD HelloWorld.class /HelloWorld.class
RUN chmod +x /HelloWorld.class
ENTRYPOINT ["java", "HelloWorld"]
