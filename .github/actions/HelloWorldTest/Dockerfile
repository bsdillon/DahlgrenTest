FROM openjdk:7
COPY . HelloWorldTest
WORKDIR HelloWorldTest
CMD javac HelloWorld.java
CMD exec pwd
CMD exec ls
ADD HelloWorld.class /HelloWorld.class
RUN chmod +x /HelloWorld.class
ENTRYPOINT ["java", "HelloWorld"]
