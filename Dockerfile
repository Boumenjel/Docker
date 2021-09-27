FROM openjdk:8
EXPOSE 8084
ADD target/jenkinsapp.jar /jenkinsapp.jar
ENTRYPOINT ["java","-jar","/jenkinsapp.jar"]